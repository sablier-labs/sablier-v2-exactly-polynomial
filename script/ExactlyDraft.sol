// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity >=0.8.19;

import { ISablierV2LockupDynamic } from "@sablier/v2-core/src/interfaces/ISablierV2LockupDynamic.sol";
import { LockupDynamic } from "@sablier/v2-core/src/types/DataTypes.sol";
import { ud2x18 } from "@sablier/v2-core/src/types/Math.sol";
import { IERC20 } from "@sablier/v2-core/src/types/Tokens.sol";
import { BaseScript } from "@sablier/v2-core-script/Base.s.sol";
// import { ISablierV2ProxyTarget } from "@sablier/v2-periphery/src/interfaces/ISablierV2ProxyTarget.sol";
// import { Batch } from "@sablier/v2-periphery/src/types/DataTypes.sol";
// import { IPRBProxy, IPRBProxyPlugin, IPRBProxyRegistry } from "@sablier/v2-periphery/src/types/Proxy.sol";

contract ExactlyDraftScript is BaseScript {
    /*//////////////////////////////////////////////////////////////////////////
                                   EXACTLY PARAMS
    //////////////////////////////////////////////////////////////////////////*/

    IERC20 public constant EXA = IERC20(0x1e925De1c68ef83bD98eE3E130eF14a50309C01B);
    uint128 public constant AMOUNT_0 = 491_300e18; // user 0 amount
    uint128 public constant AGGREGATE_AMOUNT = 491_300e18;

    /*//////////////////////////////////////////////////////////////////////////
                                   SABLIER PARAMS
    //////////////////////////////////////////////////////////////////////////*/

    // Check the address: https://prbproxy.com/
    // IPRBProxyRegistry public constant PROXY_REGISTRY = IPRBProxyRegistry(0x584009E9eDe26e212182c9745F5c000191296a78);

    // Check the addresses in the docs: https://docs.sablier.com/contracts/v2/deployments
    ISablierV2LockupDynamic public constant SABLIER_LOCKUP_DYNAMIC =
        ISablierV2LockupDynamic(0x665d1C8337F1035cfBe13DD94bB669110b975f5F);
    // address public constant SABLIER_PROXY_PLUGIN = 0x17167A7e2763121e263B4331B700a1BF9113b387;
    // ISablierV2ProxyTarget public immutable SABLIER_PROXY_TARGET =
    //     ISablierV2ProxyTarget(0xD87d75ceE7b7c5B9FAC5F9b37C55B53F682B9058);

    /*//////////////////////////////////////////////////////////////////////////
                                    SCRIPT LOGIC
    //////////////////////////////////////////////////////////////////////////*/

    function run() public virtual broadcast returns (uint256[] memory streamIds) {
        // Deploy an instance of PRBProxy. For more info, see:
        // https://docs.sablier.com/contracts/v2/guides/proxy-architecture/overview
        // IPRBProxy proxy = PROXY_REGISTRY.getProxy({ user: address(this) });
        // if (address(proxy) == address(0)) {
        //     proxy = PROXY_REGISTRY.deployAndInstallPlugin({ plugin: IPRBProxyPlugin(SABLIER_PROXY_PLUGIN) });
        // }

        // // Approve the proxy to transfer $EXA
        uint256 allowance = EXA.allowance({ owner: address(this), spender: address(SABLIER_LOCKUP_DYNAMIC) });
        if (allowance < AGGREGATE_AMOUNT) {
            EXA.approve({ spender: address(SABLIER_LOCKUP_DYNAMIC), amount: AGGREGATE_AMOUNT });
        }

        // // Get the batch data
        // Batch.CreateWithMilestones[] memory batch = getBatch(address(proxy));

        // // Encode the data for the proxy
        // bytes memory data = abi.encodeCall(
        //     SABLIER_PROXY_TARGET.batchCreateWithMilestones, (SABLIER_LOCKUP_DYNAMIC, EXA, batch, bytes(""))
        // );

        // // Create a batch of streams via the proxy and Sablier's proxy target
        // bytes memory response = proxy.execute(address(SABLIER_PROXY_TARGET), data);
        // streamIds = abi.decode(response, (uint256[]));
    }

    // An exponent of 1e18 means the segment will be streaming linearly
    function getSegment(uint128 amount, uint40 milestone) public pure returns (LockupDynamic.Segment memory) {
        LockupDynamic.Segment memory segment =
            LockupDynamic.Segment({ amount: amount, milestone: milestone, exponent: ud2x18(1) });
        return segment;
    }

    function getSegmentsForUser(uint256 userIndex) public pure returns (LockupDynamic.Segment[] memory) {
        LockupDynamic.Segment[] memory segments = new LockupDynamic.Segment[](37);

        if (userIndex == 0) {
            segments[0] = getSegment({ amount: 237e18, milestone: 1_717_200_000 }); // Jun 1, 2024 at 00:00
            segments[1] = getSegment({ amount: 275e18, milestone: 1_719_792_000 }); // Jul 1, 2024 at 00:00
            segments[2] = getSegment({ amount: 314e18, milestone: 1_722_470_400 }); // Aug 1, 2024 at 00:00
            segments[3] = getSegment({ amount: 354e18, milestone: 1_725_148_800 }); // Sep 1, 2024 at 00:00
            segments[4] = getSegment({ amount: 390e18, milestone: 1_727_740_800 }); // Oct 1, 2024 at 00:00
            segments[5] = getSegment({ amount: 432e18, milestone: 1_730_419_200 }); // Nov 1, 2024 at 00:00
            segments[6] = getSegment({ amount: 467e18, milestone: 1_733_011_200 }); // Dec 1, 2024 at 00:00
            segments[7] = getSegment({ amount: 509e18, milestone: 1_735_689_600 }); // Jan 1, 2025 at 00:00
            segments[8] = getSegment({ amount: 549e18, milestone: 1_738_368_000 }); // Feb 1, 2025 at 00:00
            segments[9] = getSegment({ amount: 569e18, milestone: 1_740_787_200 }); // Mar 1, 2025 at 00:00
            segments[10] = getSegment({ amount: 626e18, milestone: 1_743_465_600 }); // Apr 1, 2025 at 00:00
            segments[11] = getSegment({ amount: 657e18, milestone: 1_746_057_600 }); // May 1, 2025 at 00:00
            segments[12] = getSegment({ amount: 703e18, milestone: 1_748_736_000 }); // Jun 1, 2025 at 00:00
            segments[13] = getSegment({ amount: 734e18, milestone: 1_751_328_000 }); // Jul 1, 2025 at 00:00
            segments[14] = getSegment({ amount: 781e18, milestone: 1_754_006_400 }); // Aug 1, 2025 at 00:00
            segments[15] = getSegment({ amount: 821e18, milestone: 1_756_684_800 }); // Sep 1, 2025 at 00:00
            segments[16] = getSegment({ amount: 849e18, milestone: 1_759_276_800 }); // Oct 1, 2025 at 00:00
            segments[17] = getSegment({ amount: 898e18, milestone: 1_761_955_200 }); // Nov 1, 2025 at 00:00
            segments[18] = getSegment({ amount: 926e18, milestone: 1_764_547_200 }); // Dec 1, 2025 at 00:00
            segments[19] = getSegment({ amount: 976e18, milestone: 1_767_225_600 }); // Jan 1, 2026 at 00:00
            segments[20] = getSegment({ amount: 1016e18, milestone: 1_769_904_000 }); // Feb 1, 2026 at 00:00
            segments[21] = getSegment({ amount: 1013e18, milestone: 1_772_323_200 }); // Mar 1, 2026 at 00:00
            segments[22] = getSegment({ amount: 1092e18, milestone: 1_775_001_600 }); // Apr 1, 2026 at 00:00
            segments[23] = getSegment({ amount: 1116e18, milestone: 1_777_593_600 }); // May 1, 2026 at 00:00
            segments[24] = getSegment({ amount: 1170e18, milestone: 1_780_272_000 }); // Jun 1, 2026 at 00:00
            segments[25] = getSegment({ amount: 1193e18, milestone: 1_782_864_000 }); // Jul 1, 2026 at 00:00
            segments[26] = getSegment({ amount: 1248e18, milestone: 1_785_542_400 }); // Aug 1, 2026 at 00:00
            segments[27] = getSegment({ amount: 1287e18, milestone: 1_788_220_800 }); // Sep 1, 2026 at 00:00
            segments[28] = getSegment({ amount: 1308e18, milestone: 1_790_812_800 }); // Oct 1, 2026 at 00:00
            segments[29] = getSegment({ amount: 1365e18, milestone: 1_793_491_200 }); // Nov 1, 2026 at 00:00
            segments[30] = getSegment({ amount: 1384e18, milestone: 1_796_083_200 }); // Dec 1, 2026 at 00:00
            segments[31] = getSegment({ amount: 1443e18, milestone: 1_798_761_600 }); // Jan 1, 2027 at 00:00
            segments[32] = getSegment({ amount: 1482e18, milestone: 1_801_440_000 }); // Feb 1, 2027 at 00:00
            segments[33] = getSegment({ amount: 1457e18, milestone: 1_803_859_200 }); // Mar 1, 2027 at 00:00
            segments[34] = getSegment({ amount: 1559e18, milestone: 1_806_537_600 }); // Apr 1, 2027 at 00:00
            segments[35] = getSegment({ amount: 1575e18, milestone: 1_809_129_600 }); // May 1, 2027 at 00:00
            segments[36] = getSegment({ amount: 1449e18, milestone: 1_811_808_000 }); // Jun 1, 2027 at 00:00
        } else {
            revert("Invalid user index");
        }

        return segments;
    }

    // function getBatch(address proxy) public pure returns (Batch.CreateWithMilestones[] memory) {
    //     Batch.CreateWithMilestones[] memory batch = new Batch.CreateWithMilestones[](6);

    //     batch[0].sender = address(proxy);
    //     batch[0].recipient = address(0xCAFE000000000000000000000000000000000000);
    //     batch[0].totalAmount = AMOUNT_0;
    //     batch[0].cancelable = false;
    //     batch[0].segments = getSegmentsForUser({ userIndex: 0 });

    //     return batch;
    // }
}
