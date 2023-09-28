// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity >=0.8.19;

import { ISablierV2LockupDynamic } from "@sablier/v2-core/src/interfaces/ISablierV2LockupDynamic.sol";
import { Broker, LockupDynamic } from "@sablier/v2-core/src/types/DataTypes.sol";
import { ud2x18, ud60x18 } from "@sablier/v2-core/src/types/Math.sol";
import { IERC20 } from "@sablier/v2-core/src/types/Tokens.sol";
import { BaseScript } from "@sablier/v2-core-script/Base.s.sol";
import { ISablierV2Batch } from "@sablier/v2-periphery/src/interfaces/ISablierV2Batch.sol";
import { Batch } from "@sablier/v2-periphery/src/types/DataTypes.sol";

contract ExactlyProtocolScript is BaseScript {
    IERC20 public constant EXA = IERC20(0x1e925De1c68ef83bD98eE3E130eF14a50309C01B);
    uint128 public constant AGGREGATE_AMOUNT = 491_300e18;

    // Check the addresses in the docs: https://docs.sablier.com/contracts/v2/deployments
    ISablierV2LockupDynamic public constant SABLIER_LOCKUP_DYNAMIC =
        ISablierV2LockupDynamic(0x6f68516c21E248cdDfaf4898e66b2b0Adee0e0d6);

    ISablierV2Batch public batch;

    Broker public broker = Broker({ account: address(0), fee: ud60x18(0) });

    // TODO: implement function run

    function getParamsForUser1() public view returns (Batch.CreateWithMilestones memory) {
        return Batch.CreateWithMilestones({
            sender: address(this),
            startTime: 1_704_060_000, // Jan 1, 2024
            cancelable: false,
            recipient: 0xA4F5f3848142116fe061e7255C133003a41ABce8,
            totalAmount: 202_086e18,
            broker: broker,
            segments: getSegmentsForUser1()
        });
    }

    function getSegment(uint128 amount, uint40 milestone) public pure returns (LockupDynamic.Segment memory) {
        LockupDynamic.Segment memory segment =
            LockupDynamic.Segment({ amount: amount, milestone: milestone, exponent: ud2x18(1) });
        return segment;
    }

    function getSegmentsForUser1() public pure returns (LockupDynamic.Segment[] memory) {
        LockupDynamic.Segment[] memory segments = new LockupDynamic.Segment[](36);
        segments[0] = getSegment({ amount: 3039e18, milestone: 1_706_652_000 }); // January 31, 2024
        segments[1] = getSegment({ amount: 6301e18, milestone: 1_709_157_600 }); // February 29, 2024
        segments[2] = getSegment({ amount: 9809e18, milestone: 1_711_836_000 }); // March 31, 2024
        segments[3] = getSegment({ amount: 13_540e18, milestone: 1_714_424_400 }); // April 30, 2024
        segments[4] = getSegment({ amount: 17_521e18, milestone: 1_717_102_800 }); // May 31, 2024
        segments[5] = getSegment({ amount: 21_716e18, milestone: 1_719_694_800 }); // June 30, 2024
        segments[6] = getSegment({ amount: 26_169e18, milestone: 1_722_373_200 }); // July 31, 2024
        segments[7] = getSegment({ amount: 30_861e18, milestone: 1_725_051_600 }); // August 31, 2024
        segments[8] = getSegment({ amount: 35_756e18, milestone: 1_727_643_600 }); // September 30, 2024
        segments[9] = getSegment({ amount: 40_920e18, milestone: 1_730_325_600 }); // October 31, 2024
        segments[10] = getSegment({ amount: 46_280e18, milestone: 1_732_917_600 }); // November 30, 2024
        segments[11] = getSegment({ amount: 51_916e18, milestone: 1_735_596_000 }); // December 31, 2024
        segments[12] = getSegment({ amount: 57_791e18, milestone: 1_738_274_400 }); // January 31, 2025
        segments[13] = getSegment({ amount: 63_743e18, milestone: 1_740_693_600 }); // February 28, 2025
        segments[14] = getSegment({ amount: 70_082e18, milestone: 1_743_368_400 }); // March 31, 2025
        segments[15] = getSegment({ amount: 76_599e18, milestone: 1_745_960_400 }); // April 30, 2025
        segments[16] = getSegment({ amount: 83_411e18, milestone: 1_748_638_800 }); // May 31, 2025
        segments[17] = getSegment({ amount: 90_392e18, milestone: 1_751_230_800 }); // June 30, 2025
        segments[18] = getSegment({ amount: 97_677e18, milestone: 1_753_909_200 }); // July 31, 2025
        segments[19] = getSegment({ amount: 105_200e18, milestone: 1_756_587_600 }); // August 31, 2025
        segments[20] = getSegment({ amount: 112_881e18, milestone: 1_759_179_600 }); // September 30, 2025
        segments[21] = getSegment({ amount: 120_877e18, milestone: 1_761_861_600 }); // October 31, 2025
        segments[22] = getSegment({ amount: 129_022e18, milestone: 1_764_453_600 }); // November 30, 2025
        segments[23] = getSegment({ amount: 134_724e18, milestone: 1_767_132_000 }); // December 31, 2025
        segments[24] = getSegment({ amount: 140_338e18, milestone: 1_769_810_400 }); // January 31, 2026
        segments[25] = getSegment({ amount: 145_951e18, milestone: 1_772_229_600 }); // February 28, 2026
        segments[26] = getSegment({ amount: 151_565e18, milestone: 1_774_904_400 }); // March 31, 2026
        segments[27] = getSegment({ amount: 157_178e18, milestone: 1_777_496_400 }); // April 30, 2026
        segments[28] = getSegment({ amount: 162_792e18, milestone: 1_780_174_800 }); // May 31, 2026
        segments[29] = getSegment({ amount: 168_405e18, milestone: 1_782_766_800 }); // June 30, 2026
        segments[30] = getSegment({ amount: 174_019e18, milestone: 1_785_445_200 }); // July 31, 2026
        segments[31] = getSegment({ amount: 179_632e18, milestone: 1_788_123_600 }); // August 31, 2026
        segments[32] = getSegment({ amount: 185_246e18, milestone: 1_790_715_600 }); // September 30, 2026
        segments[33] = getSegment({ amount: 190_859e18, milestone: 1_793_397_600 }); // October 31, 2026
        segments[34] = getSegment({ amount: 196_473e18, milestone: 1_795_989_600 }); // November 30, 2026
        segments[35] = getSegment({ amount: 202_086e18, milestone: 1_798_668_000 }); // December 31, 2026
        return segments;
    }

    function getSegmentsForUser2() public pure returns (LockupDynamic.Segment[] memory) {
        LockupDynamic.Segment[] memory segments = new LockupDynamic.Segment[](36);
        segments[0] = getSegment({ amount: 2007e18, milestone: 1_706_652_000 }); // January 31, 2024
        segments[1] = getSegment({ amount: 4180e18, milestone: 1_709_157_600 }); // February 29, 2024
        segments[2] = getSegment({ amount: 6536e18, milestone: 1_711_836_000 }); // March 31, 2024
        segments[3] = getSegment({ amount: 9059e18, milestone: 1_714_424_400 }); // April 30, 2024
        segments[4] = getSegment({ amount: 11_767e18, milestone: 1_717_102_800 }); // May 31, 2024
        segments[5] = getSegment({ amount: 14_636e18, milestone: 1_719_694_800 }); // June 30, 2024
        segments[6] = getSegment({ amount: 17_697e18, milestone: 1_722_373_200 }); // July 31, 2024
        segments[7] = getSegment({ amount: 20_935e18, milestone: 1_725_051_600 }); // August 31, 2024
        segments[8] = getSegment({ amount: 24_325e18, milestone: 1_727_643_600 }); // September 30, 2024
        segments[9] = getSegment({ amount: 27_915e18, milestone: 1_730_325_600 }); // October 31, 2024
        segments[10] = getSegment({ amount: 31_651e18, milestone: 1_732_917_600 }); // November 30, 2024
        segments[11] = getSegment({ amount: 35_594e18, milestone: 1_735_596_000 }); // December 31, 2024
        segments[12] = getSegment({ amount: 39_714e18, milestone: 1_738_274_400 }); // January 31, 2025
        segments[13] = getSegment({ amount: 43_891e18, milestone: 1_740_693_600 }); // February 28, 2025
        segments[14] = getSegment({ amount: 48_357e18, milestone: 1_743_368_400 }); // March 31, 2025
        segments[15] = getSegment({ amount: 52_956e18, milestone: 1_745_960_400 }); // April 30, 2025
        segments[16] = getSegment({ amount: 57_774e18, milestone: 1_748_638_800 }); // May 31, 2025
        segments[17] = getSegment({ amount: 62_719e18, milestone: 1_751_230_800 }); // June 30, 2025
        segments[18] = getSegment({ amount: 67_889e18, milestone: 1_753_909_200 }); // July 31, 2025
        segments[19] = getSegment({ amount: 73_238e18, milestone: 1_756_587_600 }); // August 31, 2025
        segments[20] = getSegment({ amount: 78_703e18, milestone: 1_759_179_600 }); // September 30, 2025
        segments[21] = getSegment({ amount: 84_404e18, milestone: 1_761_861_600 }); // October 31, 2025
        segments[22] = getSegment({ amount: 90_216e18, milestone: 1_764_453_600 }); // November 30, 2025
        segments[23] = getSegment({ amount: 96_268e18, milestone: 1_767_132_000 }); // December 31, 2025
        segments[24] = getSegment({ amount: 102_498e18, milestone: 1_769_810_400 }); // January 31, 2026
        segments[25] = getSegment({ amount: 108_683e18, milestone: 1_772_229_600 }); // February 28, 2026
        segments[26] = getSegment({ amount: 112_940e18, milestone: 1_774_904_400 }); // March 31, 2026
        segments[27] = getSegment({ amount: 117_123e18, milestone: 1_777_496_400 }); // April 30, 2026
        segments[28] = getSegment({ amount: 121_306e18, milestone: 1_780_174_800 }); // May 31, 2026
        segments[29] = getSegment({ amount: 125_489e18, milestone: 1_782_766_800 }); // June 30, 2026
        segments[30] = getSegment({ amount: 129_672e18, milestone: 1_785_445_200 }); // July 31, 2026
        segments[31] = getSegment({ amount: 133_855e18, milestone: 1_788_123_600 }); // August 31, 2026
        segments[32] = getSegment({ amount: 138_038e18, milestone: 1_790_715_600 }); // September 30, 2026
        segments[33] = getSegment({ amount: 142_221e18, milestone: 1_793_397_600 }); // October 31, 2026
        segments[34] = getSegment({ amount: 146_404e18, milestone: 1_795_989_600 }); // November 30, 2026
        segments[35] = getSegment({ amount: 150_587e18, milestone: 1_798_668_000 }); // December 31, 2026
        return segments;
    }

    function getSegmentsForUser3() public pure returns (LockupDynamic.Segment[] memory) {
        LockupDynamic.Segment[] memory segments = new LockupDynamic.Segment[](36);
        segments[0] = getSegment({ amount: 237e18, milestone: 1_717_102_800 }); // May 31, 2024
        segments[1] = getSegment({ amount: 512e18, milestone: 1_719_694_800 }); // June 30, 2024
        segments[2] = getSegment({ amount: 826e18, milestone: 1_722_373_200 }); // July 31, 2024
        segments[3] = getSegment({ amount: 1180e18, milestone: 1_725_051_600 }); // August 31, 2024
        segments[4] = getSegment({ amount: 1570e18, milestone: 1_727_643_600 }); // September 30, 2024
        segments[5] = getSegment({ amount: 2002e18, milestone: 1_730_325_600 }); // October 31, 2024
        segments[6] = getSegment({ amount: 2469e18, milestone: 1_732_917_600 }); // November 30, 2024
        segments[7] = getSegment({ amount: 2978e18, milestone: 1_735_596_000 }); // December 31, 2024
        segments[8] = getSegment({ amount: 3527e18, milestone: 1_738_274_400 }); // January 31, 2025
        segments[9] = getSegment({ amount: 4096e18, milestone: 1_740_693_600 }); // February 28, 2025
        segments[10] = getSegment({ amount: 4722e18, milestone: 1_743_368_400 }); // March 31, 2025
        segments[11] = getSegment({ amount: 5379e18, milestone: 1_745_960_400 }); // April 30, 2025
        segments[12] = getSegment({ amount: 6082e18, milestone: 1_748_638_800 }); // May 31, 2025
        segments[13] = getSegment({ amount: 6816e18, milestone: 1_751_230_800 }); // June 30, 2025
        segments[14] = getSegment({ amount: 7597e18, milestone: 1_753_909_200 }); // July 31, 2025
        segments[15] = getSegment({ amount: 8418e18, milestone: 1_756_587_600 }); // August 31, 2025
        segments[16] = getSegment({ amount: 9267e18, milestone: 1_759_179_600 }); // September 30, 2025
        segments[17] = getSegment({ amount: 10_165e18, milestone: 1_761_861_600 }); // October 31, 2025
        segments[18] = getSegment({ amount: 11_091e18, milestone: 1_764_453_600 }); // November 30, 2025
        segments[19] = getSegment({ amount: 12_067e18, milestone: 1_767_132_000 }); // December 31, 2025
        segments[20] = getSegment({ amount: 13_083e18, milestone: 1_769_810_400 }); // January 31, 2026
        segments[21] = getSegment({ amount: 14_096e18, milestone: 1_772_229_600 }); // February 28, 2026
        segments[22] = getSegment({ amount: 15_188e18, milestone: 1_774_904_400 }); // March 31, 2026
        segments[23] = getSegment({ amount: 16_304e18, milestone: 1_777_496_400 }); // April 30, 2026
        segments[24] = getSegment({ amount: 17_474e18, milestone: 1_780_174_800 }); // May 31, 2026
        segments[25] = getSegment({ amount: 18_667e18, milestone: 1_782_766_800 }); // June 30, 2026
        segments[26] = getSegment({ amount: 19_915e18, milestone: 1_785_445_200 }); // July 31, 2026
        segments[27] = getSegment({ amount: 21_202e18, milestone: 1_788_123_600 }); // August 31, 2026
        segments[28] = getSegment({ amount: 22_510e18, milestone: 1_790_715_600 }); // September 30, 2026
        segments[29] = getSegment({ amount: 23_875e18, milestone: 1_793_397_600 }); // October 31, 2026
        segments[30] = getSegment({ amount: 25_259e18, milestone: 1_795_989_600 }); // November 30, 2026
        segments[31] = getSegment({ amount: 26_702e18, milestone: 1_798_668_000 }); // December 31, 2026
        segments[32] = getSegment({ amount: 28_184e18, milestone: 1_801_346_400 }); // January 31, 2027
        segments[33] = getSegment({ amount: 29_641e18, milestone: 1_803_765_600 }); // February 28, 2027
        segments[34] = getSegment({ amount: 31_200e18, milestone: 1_806_440_400 }); // March 31, 2027
        segments[35] = getSegment({ amount: 32_775e18, milestone: 1_809_032_400 }); // April 30, 2027
        segments[36] = getSegment({ amount: 34_224e18, milestone: 1_811_710_800 }); // May 31, 2027
        return segments;
    }

    function getSegmentsForUser4() public pure returns (LockupDynamic.Segment[] memory) {
        LockupDynamic.Segment[] memory segments = new LockupDynamic.Segment[](36);
        segments[0] = getSegment({ amount: 234e18, milestone: 1_706_652_000 }); // January 31, 2024
        segments[1] = getSegment({ amount: 488e18, milestone: 1_709_157_600 }); // February 29, 2024
        segments[2] = getSegment({ amount: 766e18, milestone: 1_711_836_000 }); // March 31, 2024
        segments[3] = getSegment({ amount: 1064e18, milestone: 1_714_424_400 }); // April 30, 2024
        segments[4] = getSegment({ amount: 1386e18, milestone: 1_717_102_800 }); // May 31, 2024
        segments[5] = getSegment({ amount: 1727e18, milestone: 1_719_694_800 }); // June 30, 2024
        segments[6] = getSegment({ amount: 2093e18, milestone: 1_722_373_200 }); // July 31, 2024
        segments[7] = getSegment({ amount: 2482e18, milestone: 1_725_051_600 }); // August 31, 2024
        segments[8] = getSegment({ amount: 2889e18, milestone: 1_727_643_600 }); // September 30, 2024
        segments[9] = getSegment({ amount: 3321e18, milestone: 1_730_325_600 }); // October 31, 2024
        segments[10] = getSegment({ amount: 3772e18, milestone: 1_732_917_600 }); // November 30, 2024
        segments[11] = getSegment({ amount: 4249e18, milestone: 1_735_596_000 }); // December 31, 2024
        segments[12] = getSegment({ amount: 4747e18, milestone: 1_738_274_400 }); // January 31, 2025
        segments[13] = getSegment({ amount: 5253e18, milestone: 1_740_693_600 }); // February 28, 2025
        segments[14] = getSegment({ amount: 5796e18, milestone: 1_743_368_400 }); // March 31, 2025
        segments[15] = getSegment({ amount: 6355e18, milestone: 1_745_960_400 }); // April 30, 2025
        segments[16] = getSegment({ amount: 6941e18, milestone: 1_748_638_800 }); // May 31, 2025
        segments[17] = getSegment({ amount: 7544e18, milestone: 1_751_230_800 }); // June 30, 2025
        segments[18] = getSegment({ amount: 8175e18, milestone: 1_753_909_200 }); // July 31, 2025
        segments[19] = getSegment({ amount: 8828e18, milestone: 1_756_587_600 }); // August 31, 2025
        segments[20] = getSegment({ amount: 9496e18, milestone: 1_759_179_600 }); // September 30, 2025
        segments[21] = getSegment({ amount: 10_193e18, milestone: 1_761_861_600 }); // October 31, 2025
        segments[22] = getSegment({ amount: 10_904e18, milestone: 1_764_453_600 }); // November 30, 2025
        segments[23] = getSegment({ amount: 11_646e18, milestone: 1_767_132_000 }); // December 31, 2025
        segments[24] = getSegment({ amount: 12_409e18, milestone: 1_769_810_400 }); // January 31, 2026
        segments[25] = getSegment({ amount: 13_168e18, milestone: 1_772_229_600 }); // February 28, 2026
        segments[26] = getSegment({ amount: 13_975e18, milestone: 1_774_904_400 }); // March 31, 2026
        segments[27] = getSegment({ amount: 14_704e18, milestone: 1_777_496_400 }); // April 30, 2026
        segments[28] = getSegment({ amount: 15_229e18, milestone: 1_780_174_800 }); // May 31, 2026
        segments[29] = getSegment({ amount: 15_754e18, milestone: 1_782_766_800 }); // June 30, 2026
        segments[30] = getSegment({ amount: 16_279e18, milestone: 1_785_445_200 }); // July 31, 2026
        segments[31] = getSegment({ amount: 16_804e18, milestone: 1_788_123_600 }); // August 31, 2026
        segments[32] = getSegment({ amount: 17_329e18, milestone: 1_790_715_600 }); // September 30, 2026
        segments[33] = getSegment({ amount: 17_855e18, milestone: 1_793_397_600 }); // October 31, 2026
        segments[34] = getSegment({ amount: 18_380e18, milestone: 1_795_989_600 }); // November 30, 2026
        segments[35] = getSegment({ amount: 18_905e18, milestone: 1_798_668_000 }); // December 31, 2026
        return segments;
    }

    function getSegmentsForUser5() public pure returns (LockupDynamic.Segment[] memory) {
        LockupDynamic.Segment[] memory segments = new LockupDynamic.Segment[](36);
        segments[0] = getSegment({ amount: 43e18, milestone: 1_717_102_800 }); // May 31, 2024
        segments[1] = getSegment({ amount: 93e18, milestone: 1_719_694_800 }); // June 30, 2024
        segments[2] = getSegment({ amount: 150e18, milestone: 1_722_373_200 }); // July 31, 2024
        segments[3] = getSegment({ amount: 214e18, milestone: 1_725_051_600 }); // August 31, 2024
        segments[4] = getSegment({ amount: 284e18, milestone: 1_727_643_600 }); // September 30, 2024
        segments[5] = getSegment({ amount: 362e18, milestone: 1_730_325_600 }); // October 31, 2024
        segments[6] = getSegment({ amount: 447e18, milestone: 1_732_917_600 }); // November 30, 2024
        segments[7] = getSegment({ amount: 539e18, milestone: 1_735_596_000 }); // December 31, 2024
        segments[8] = getSegment({ amount: 638e18, milestone: 1_738_274_400 }); // January 31, 2025
        segments[9] = getSegment({ amount: 741e18, milestone: 1_740_693_600 }); // February 28, 2025
        segments[10] = getSegment({ amount: 854e18, milestone: 1_743_368_400 }); // March 31, 2025
        segments[11] = getSegment({ amount: 973e18, milestone: 1_745_960_400 }); // April 30, 2025
        segments[12] = getSegment({ amount: 1101e18, milestone: 1_748_638_800 }); // May 31, 2025
        segments[13] = getSegment({ amount: 1233e18, milestone: 1_751_230_800 }); // June 30, 2025
        segments[14] = getSegment({ amount: 1375e18, milestone: 1_753_909_200 }); // July 31, 2025
        segments[15] = getSegment({ amount: 1523e18, milestone: 1_756_587_600 }); // August 31, 2025
        segments[16] = getSegment({ amount: 1677e18, milestone: 1_759_179_600 }); // September 30, 2025
        segments[17] = getSegment({ amount: 1839e18, milestone: 1_761_861_600 }); // October 31, 2025
        segments[18] = getSegment({ amount: 2007e18, milestone: 1_764_453_600 }); // November 30, 2025
        segments[19] = getSegment({ amount: 2184e18, milestone: 1_767_132_000 }); // December 31, 2025
        segments[20] = getSegment({ amount: 2367e18, milestone: 1_769_810_400 }); // January 31, 2026
        segments[21] = getSegment({ amount: 2551e18, milestone: 1_772_229_600 }); // February 28, 2026
        segments[22] = getSegment({ amount: 2748e18, milestone: 1_774_904_400 }); // March 31, 2026
        segments[23] = getSegment({ amount: 2950e18, milestone: 1_777_496_400 }); // April 30, 2026
        segments[24] = getSegment({ amount: 3162e18, milestone: 1_780_174_800 }); // May 31, 2026
        segments[25] = getSegment({ amount: 3378e18, milestone: 1_782_766_800 }); // June 30, 2026
        segments[26] = getSegment({ amount: 3604e18, milestone: 1_785_445_200 }); // July 31, 2026
        segments[27] = getSegment({ amount: 3837e18, milestone: 1_788_123_600 }); // August 31, 2026
        segments[28] = getSegment({ amount: 4073e18, milestone: 1_790_715_600 }); // September 30, 2026
        segments[29] = getSegment({ amount: 4320e18, milestone: 1_793_397_600 }); // October 31, 2026
        segments[30] = getSegment({ amount: 4571e18, milestone: 1_795_989_600 }); // November 30, 2026
        segments[31] = getSegment({ amount: 4832e18, milestone: 1_798_668_000 }); // December 31, 2026
        segments[32] = getSegment({ amount: 5100e18, milestone: 1_801_346_400 }); // January 31, 2027
        segments[33] = getSegment({ amount: 5364e18, milestone: 1_803_765_600 }); // February 28, 2027
        segments[34] = getSegment({ amount: 5646e18, milestone: 1_806_440_400 }); // March 31, 2027
        segments[35] = getSegment({ amount: 5931e18, milestone: 1_809_032_400 }); // April 30, 2027
        segments[36] = getSegment({ amount: 6193e18, milestone: 1_811_710_800 }); // May 31, 2027
        return segments;
    }

    function getSegmentsForUser6() public pure returns (LockupDynamic.Segment[] memory) {
        LockupDynamic.Segment[] memory segments = new LockupDynamic.Segment[](36);
        segments[0] = getSegment({ amount: 450e18, milestone: 1_706_652_000 }); // January 31, 2024
        segments[1] = getSegment({ amount: 942e18, milestone: 1_709_157_600 }); // February 29, 2024
        segments[2] = getSegment({ amount: 1480e18, milestone: 1_711_836_000 }); // March 31, 2024
        segments[3] = getSegment({ amount: 2058e18, milestone: 1_714_424_400 }); // April 30, 2024
        segments[4] = getSegment({ amount: 2683e18, milestone: 1_717_102_800 }); // May 31, 2024
        segments[5] = getSegment({ amount: 3348e18, milestone: 1_719_694_800 }); // June 30, 2024
        segments[6] = getSegment({ amount: 4061e18, milestone: 1_722_373_200 }); // July 31, 2024
        segments[7] = getSegment({ amount: 4818e18, milestone: 1_725_051_600 }); // August 31, 2024
        segments[8] = getSegment({ amount: 5612e18, milestone: 1_727_643_600 }); // September 30, 2024
        segments[9] = getSegment({ amount: 6457e18, milestone: 1_730_325_600 }); // October 31, 2024
        segments[10] = getSegment({ amount: 7338e18, milestone: 1_732_917_600 }); // November 30, 2024
        segments[11] = getSegment({ amount: 8270e18, milestone: 1_735_596_000 }); // December 31, 2024
        segments[12] = getSegment({ amount: 9246e18, milestone: 1_738_274_400 }); // January 31, 2025
        segments[13] = getSegment({ amount: 10_237e18, milestone: 1_740_693_600 }); // February 28, 2025
        segments[14] = getSegment({ amount: 11_299e18, milestone: 1_743_368_400 }); // March 31, 2025
        segments[15] = getSegment({ amount: 12_395e18, milestone: 1_745_960_400 }); // April 30, 2025
        segments[16] = getSegment({ amount: 13_545e18, milestone: 1_748_638_800 }); // May 31, 2025
        segments[17] = getSegment({ amount: 14_727e18, milestone: 1_751_230_800 }); // June 30, 2025
        segments[18] = getSegment({ amount: 15_965e18, milestone: 1_753_909_200 }); // July 31, 2025
        segments[19] = getSegment({ amount: 17_247e18, milestone: 1_756_587_600 }); // August 31, 2025
        segments[20] = getSegment({ amount: 18_558e18, milestone: 1_759_179_600 }); // September 30, 2025
        segments[21] = getSegment({ amount: 19_928e18, milestone: 1_761_861_600 }); // October 31, 2025
        segments[22] = getSegment({ amount: 21_325e18, milestone: 1_764_453_600 }); // November 30, 2025
        segments[23] = getSegment({ amount: 22_783e18, milestone: 1_767_132_000 }); // December 31, 2025
        segments[24] = getSegment({ amount: 24_284e18, milestone: 1_769_810_400 }); // January 31, 2026
        segments[25] = getSegment({ amount: 25_774e18, milestone: 1_772_229_600 }); // February 28, 2026
        segments[26] = getSegment({ amount: 27_362e18, milestone: 1_774_904_400 }); // March 31, 2026
        segments[27] = getSegment({ amount: 28_974e18, milestone: 1_777_496_400 }); // April 30, 2026
        segments[28] = getSegment({ amount: 30_195e18, milestone: 1_780_174_800 }); // May 31, 2026
        segments[29] = getSegment({ amount: 31_236e18, milestone: 1_782_766_800 }); // June 30, 2026
        segments[30] = getSegment({ amount: 32_278e18, milestone: 1_785_445_200 }); // July 31, 2026
        segments[31] = getSegment({ amount: 33_319e18, milestone: 1_788_123_600 }); // August 31, 2026
        segments[32] = getSegment({ amount: 34_360e18, milestone: 1_790_715_600 }); // September 30, 2026
        segments[33] = getSegment({ amount: 35_401e18, milestone: 1_793_397_600 }); // October 31, 2026
        segments[34] = getSegment({ amount: 36_442e18, milestone: 1_795_989_600 }); // November 30, 2026
        segments[35] = getSegment({ amount: 37_484e18, milestone: 1_798_668_000 }); // December 31, 2026
        return segments;
    }

    function getSegmentsForUser7() public pure returns (LockupDynamic.Segment[] memory) {
        LockupDynamic.Segment[] memory segments = new LockupDynamic.Segment[](36);
        segments[0] = getSegment({ amount: 235e18, milestone: 1_706_652_000 }); // January 31, 2024
        segments[1] = getSegment({ amount: 497e18, milestone: 1_709_157_600 }); // February 29, 2024
        segments[2] = getSegment({ amount: 790e18, milestone: 1_711_836_000 }); // March 31, 2024
        segments[3] = getSegment({ amount: 1111e18, milestone: 1_714_424_400 }); // April 30, 2024
        segments[4] = getSegment({ amount: 1463e18, milestone: 1_717_102_800 }); // May 31, 2024
        segments[5] = getSegment({ amount: 1841e18, milestone: 1_719_694_800 }); // June 30, 2024
        segments[6] = getSegment({ amount: 2251e18, milestone: 1_722_373_200 }); // July 31, 2024
        segments[7] = getSegment({ amount: 2691e18, milestone: 1_725_051_600 }); // August 31, 2024
        segments[8] = getSegment({ amount: 3157e18, milestone: 1_727_643_600 }); // September 30, 2024
        segments[9] = getSegment({ amount: 3655e18, milestone: 1_730_325_600 }); // October 31, 2024
        segments[10] = getSegment({ amount: 4178e18, milestone: 1_732_917_600 }); // November 30, 2024
        segments[11] = getSegment({ amount: 4736e18, milestone: 1_735_596_000 }); // December 31, 2024
        segments[12] = getSegment({ amount: 5322e18, milestone: 1_738_274_400 }); // January 31, 2025
        segments[13] = getSegment({ amount: 5919e18, milestone: 1_740_693_600 }); // February 28, 2025
        segments[14] = getSegment({ amount: 6564e18, milestone: 1_743_368_400 }); // March 31, 2025
        segments[15] = getSegment({ amount: 7230e18, milestone: 1_745_960_400 }); // April 30, 2025
        segments[16] = getSegment({ amount: 7934e18, milestone: 1_748_638_800 }); // May 31, 2025
        segments[17] = getSegment({ amount: 8658e18, milestone: 1_751_230_800 }); // June 30, 2025
        segments[18] = getSegment({ amount: 9420e18, milestone: 1_753_909_200 }); // July 31, 2025
        segments[19] = getSegment({ amount: 10_212e18, milestone: 1_756_587_600 }); // August 31, 2025
        segments[20] = getSegment({ amount: 11_023e18, milestone: 1_759_179_600 }); // September 30, 2025
        segments[21] = getSegment({ amount: 11_873e18, milestone: 1_761_861_600 }); // October 31, 2025
        segments[22] = getSegment({ amount: 12_742e18, milestone: 1_764_453_600 }); // November 30, 2025
        segments[23] = getSegment({ amount: 13_651e18, milestone: 1_767_132_000 }); // December 31, 2025
        segments[24] = getSegment({ amount: 14_590e18, milestone: 1_769_810_400 }); // January 31, 2026
        segments[25] = getSegment({ amount: 15_521e18, milestone: 1_772_229_600 }); // February 28, 2026
        segments[26] = getSegment({ amount: 16_517e18, milestone: 1_774_904_400 }); // March 31, 2026
        segments[27] = getSegment({ amount: 17_530e18, milestone: 1_777_496_400 }); // April 30, 2026
        segments[28] = getSegment({ amount: 18_585e18, milestone: 1_780_174_800 }); // May 31, 2026
        segments[29] = getSegment({ amount: 19_655e18, milestone: 1_782_766_800 }); // June 30, 2026
        segments[30] = getSegment({ amount: 20_769e18, milestone: 1_785_445_200 }); // July 31, 2026
        segments[31] = getSegment({ amount: 21_912e18, milestone: 1_788_123_600 }); // August 31, 2026
        segments[32] = getSegment({ amount: 23_006e18, milestone: 1_790_715_600 }); // September 30, 2026
        segments[33] = getSegment({ amount: 23_703e18, milestone: 1_793_397_600 }); // October 31, 2026
        segments[34] = getSegment({ amount: 24_401e18, milestone: 1_795_989_600 }); // November 30, 2026
        segments[35] = getSegment({ amount: 25_098e18, milestone: 1_798_668_000 }); // December 31, 2026
        return segments;
    }

    function getSegmentsForUser8() public pure returns (LockupDynamic.Segment[] memory) {
        LockupDynamic.Segment[] memory segments = new LockupDynamic.Segment[](36);
        segments[0] = getSegment({ amount: 283e18, milestone: 1_706_652_000 }); // January 31, 2024
        segments[1] = getSegment({ amount: 603e18, milestone: 1_709_157_600 }); // February 29, 2024
        segments[2] = getSegment({ amount: 963e18, milestone: 1_711_836_000 }); // March 31, 2024
        segments[3] = getSegment({ amount: 1361e18, milestone: 1_714_424_400 }); // April 30, 2024
        segments[4] = getSegment({ amount: 1800e18, milestone: 1_717_102_800 }); // May 31, 2024
        segments[5] = getSegment({ amount: 2275e18, milestone: 1_719_694_800 }); // June 30, 2024
        segments[6] = getSegment({ amount: 2793e18, milestone: 1_722_373_200 }); // July 31, 2024
        segments[7] = getSegment({ amount: 3350e18, milestone: 1_725_051_600 }); // August 31, 2024
        segments[8] = getSegment({ amount: 3941e18, milestone: 1_727_643_600 }); // September 30, 2024
        segments[9] = getSegment({ amount: 4577e18, milestone: 1_730_325_600 }); // October 31, 2024
        segments[10] = getSegment({ amount: 5245e18, milestone: 1_732_917_600 }); // November 30, 2024
        segments[11] = getSegment({ amount: 5959e18, milestone: 1_735_596_000 }); // December 31, 2024
        segments[12] = getSegment({ amount: 6713e18, milestone: 1_738_274_400 }); // January 31, 2025
        segments[13] = getSegment({ amount: 7480e18, milestone: 1_740_693_600 }); // February 28, 2025
        segments[14] = getSegment({ amount: 8311e18, milestone: 1_743_368_400 }); // March 31, 2025
        segments[15] = getSegment({ amount: 9171e18, milestone: 1_745_960_400 }); // April 30, 2025
        segments[16] = getSegment({ amount: 10_081e18, milestone: 1_748_638_800 }); // May 31, 2025
        segments[17] = getSegment({ amount: 11_018e18, milestone: 1_751_230_800 }); // June 30, 2025
        segments[18] = getSegment({ amount: 12_007e18, milestone: 1_753_909_200 }); // July 31, 2025
        segments[19] = getSegment({ amount: 13_034e18, milestone: 1_756_587_600 }); // August 31, 2025
        segments[20] = getSegment({ amount: 14_088e18, milestone: 1_759_179_600 }); // September 30, 2025
        segments[21] = getSegment({ amount: 15_194e18, milestone: 1_761_861_600 }); // October 31, 2025
        segments[22] = getSegment({ amount: 16_325e18, milestone: 1_764_453_600 }); // November 30, 2025
        segments[23] = getSegment({ amount: 17_510e18, milestone: 1_767_132_000 }); // December 31, 2025
        segments[24] = getSegment({ amount: 18_734e18, milestone: 1_769_810_400 }); // January 31, 2026
        segments[25] = getSegment({ amount: 19_948e18, milestone: 1_772_229_600 }); // February 28, 2026
        segments[26] = getSegment({ amount: 21_250e18, milestone: 1_774_904_400 }); // March 31, 2026
        segments[27] = getSegment({ amount: 22_573e18, milestone: 1_777_496_400 }); // April 30, 2026
        segments[28] = getSegment({ amount: 23_953e18, milestone: 1_780_174_800 }); // May 31, 2026
        segments[29] = getSegment({ amount: 25_354e18, milestone: 1_782_766_800 }); // June 30, 2026
        segments[30] = getSegment({ amount: 26_812e18, milestone: 1_785_445_200 }); // July 31, 2026
        segments[31] = getSegment({ amount: 28_310e18, milestone: 1_788_123_600 }); // August 31, 2026
        segments[32] = getSegment({ amount: 29_827e18, milestone: 1_790_715_600 }); // September 30, 2026
        segments[33] = getSegment({ amount: 31_403e18, milestone: 1_793_397_600 }); // October 31, 2026
        segments[34] = getSegment({ amount: 32_640e18, milestone: 1_795_989_600 }); // November 30, 2026
        segments[35] = getSegment({ amount: 33_572e18, milestone: 1_798_668_000 }); // December 31, 2026
        return segments;
    }

    function getSegmentsForUser9() public pure returns (LockupDynamic.Segment[] memory) {
        LockupDynamic.Segment[] memory segments = new LockupDynamic.Segment[](36);
        segments[0] = getSegment({ amount: 63e18, milestone: 1_714_424_400 }); // April 30, 2024
        segments[1] = getSegment({ amount: 137e18, milestone: 1_717_102_800 }); // May 31, 2024
        segments[2] = getSegment({ amount: 221e18, milestone: 1_719_694_800 }); // June 30, 2024
        segments[3] = getSegment({ amount: 316e18, milestone: 1_722_373_200 }); // July 31, 2024
        segments[4] = getSegment({ amount: 421e18, milestone: 1_725_051_600 }); // August 31, 2024
        segments[5] = getSegment({ amount: 536e18, milestone: 1_727_643_600 }); // September 30, 2024
        segments[6] = getSegment({ amount: 662e18, milestone: 1_730_325_600 }); // October 31, 2024
        segments[7] = getSegment({ amount: 797e18, milestone: 1_732_917_600 }); // November 30, 2024
        segments[8] = getSegment({ amount: 944e18, milestone: 1_735_596_000 }); // December 31, 2024
        segments[9] = getSegment({ amount: 1101e18, milestone: 1_738_274_400 }); // January 31, 2025
        segments[10] = getSegment({ amount: 1263e18, milestone: 1_740_693_600 }); // February 28, 2025
        segments[11] = getSegment({ amount: 1440e18, milestone: 1_743_368_400 }); // March 31, 2025
        segments[12] = getSegment({ amount: 1626e18, milestone: 1_745_960_400 }); // April 30, 2025
        segments[13] = getSegment({ amount: 1825e18, milestone: 1_748_638_800 }); // May 31, 2025
        segments[14] = getSegment({ amount: 2031e18, milestone: 1_751_230_800 }); // June 30, 2025
        segments[15] = getSegment({ amount: 2250e18, milestone: 1_753_909_200 }); // July 31, 2025
        segments[16] = getSegment({ amount: 2480e18, milestone: 1_756_587_600 }); // August 31, 2025
        segments[17] = getSegment({ amount: 2717e18, milestone: 1_759_179_600 }); // September 30, 2025
        segments[18] = getSegment({ amount: 2967e18, milestone: 1_761_861_600 }); // October 31, 2025
        segments[19] = getSegment({ amount: 3225e18, milestone: 1_764_453_600 }); // November 30, 2025
        segments[20] = getSegment({ amount: 3496e18, milestone: 1_767_132_000 }); // December 31, 2025
        segments[21] = getSegment({ amount: 3777e18, milestone: 1_769_810_400 }); // January 31, 2026
        segments[22] = getSegment({ amount: 4058e18, milestone: 1_772_229_600 }); // February 28, 2026
        segments[23] = getSegment({ amount: 4360e18, milestone: 1_774_904_400 }); // March 31, 2026
        segments[24] = getSegment({ amount: 4668e18, milestone: 1_777_496_400 }); // April 30, 2026
        segments[25] = getSegment({ amount: 4991e18, milestone: 1_780_174_800 }); // May 31, 2026
        segments[26] = getSegment({ amount: 5320e18, milestone: 1_782_766_800 }); // June 30, 2026
        segments[27] = getSegment({ amount: 5663e18, milestone: 1_785_445_200 }); // July 31, 2026
        segments[28] = getSegment({ amount: 6017e18, milestone: 1_788_123_600 }); // August 31, 2026
        segments[29] = getSegment({ amount: 6377e18, milestone: 1_790_715_600 }); // September 30, 2026
        segments[30] = getSegment({ amount: 6752e18, milestone: 1_793_397_600 }); // October 31, 2026
        segments[31] = getSegment({ amount: 7131e18, milestone: 1_795_989_600 }); // November 30, 2026
        segments[32] = getSegment({ amount: 7527e18, milestone: 1_798_668_000 }); // December 31, 2026
        segments[33] = getSegment({ amount: 7933e18, milestone: 1_801_346_400 }); // January 31, 2027
        segments[34] = getSegment({ amount: 8332e18, milestone: 1_803_765_600 }); // February 28, 2027
        segments[35] = getSegment({ amount: 8758e18, milestone: 1_806_440_400 }); // March 31, 2027
        segments[36] = getSegment({ amount: 9126e18, milestone: 1_809_032_400 }); // April 30, 2027
        return segments;
    }

    function getSegmentsForUser10() public pure returns (LockupDynamic.Segment[] memory) {
        LockupDynamic.Segment[] memory segments = new LockupDynamic.Segment[](36);
        segments[0] = getSegment({ amount: 32e18, milestone: 1_714_424_400 }); // April 30, 2024
        segments[1] = getSegment({ amount: 69e18, milestone: 1_717_102_800 }); // May 31, 2024
        segments[2] = getSegment({ amount: 111e18, milestone: 1_719_694_800 }); // June 30, 2024
        segments[3] = getSegment({ amount: 158e18, milestone: 1_722_373_200 }); // July 31, 2024
        segments[4] = getSegment({ amount: 211e18, milestone: 1_725_051_600 }); // August 31, 2024
        segments[5] = getSegment({ amount: 268e18, milestone: 1_727_643_600 }); // September 30, 2024
        segments[6] = getSegment({ amount: 331e18, milestone: 1_730_325_600 }); // October 31, 2024
        segments[7] = getSegment({ amount: 398e18, milestone: 1_732_917_600 }); // November 30, 2024
        segments[8] = getSegment({ amount: 472e18, milestone: 1_735_596_000 }); // December 31, 2024
        segments[9] = getSegment({ amount: 550e18, milestone: 1_738_274_400 }); // January 31, 2025
        segments[10] = getSegment({ amount: 631e18, milestone: 1_740_693_600 }); // February 28, 2025
        segments[11] = getSegment({ amount: 720e18, milestone: 1_743_368_400 }); // March 31, 2025
        segments[12] = getSegment({ amount: 813e18, milestone: 1_745_960_400 }); // April 30, 2025
        segments[13] = getSegment({ amount: 912e18, milestone: 1_748_638_800 }); // May 31, 2025
        segments[14] = getSegment({ amount: 1016e18, milestone: 1_751_230_800 }); // June 30, 2025
        segments[15] = getSegment({ amount: 1125e18, milestone: 1_753_909_200 }); // July 31, 2025
        segments[16] = getSegment({ amount: 1240e18, milestone: 1_756_587_600 }); // August 31, 2025
        segments[17] = getSegment({ amount: 1358e18, milestone: 1_759_179_600 }); // September 30, 2025
        segments[18] = getSegment({ amount: 1484e18, milestone: 1_761_861_600 }); // October 31, 2025
        segments[19] = getSegment({ amount: 1612e18, milestone: 1_764_453_600 }); // November 30, 2025
        segments[20] = getSegment({ amount: 1748e18, milestone: 1_767_132_000 }); // December 31, 2025
        segments[21] = getSegment({ amount: 1889e18, milestone: 1_769_810_400 }); // January 31, 2026
        segments[22] = getSegment({ amount: 2029e18, milestone: 1_772_229_600 }); // February 28, 2026
        segments[23] = getSegment({ amount: 2180e18, milestone: 1_774_904_400 }); // March 31, 2026
        segments[24] = getSegment({ amount: 2334e18, milestone: 1_777_496_400 }); // April 30, 2026
        segments[25] = getSegment({ amount: 2495e18, milestone: 1_780_174_800 }); // May 31, 2026
        segments[26] = getSegment({ amount: 2660e18, milestone: 1_782_766_800 }); // June 30, 2026
        segments[27] = getSegment({ amount: 2832e18, milestone: 1_785_445_200 }); // July 31, 2026
        segments[28] = getSegment({ amount: 3009e18, milestone: 1_788_123_600 }); // August 31, 2026
        segments[29] = getSegment({ amount: 3188e18, milestone: 1_790_715_600 }); // September 30, 2026
        segments[30] = getSegment({ amount: 3376e18, milestone: 1_793_397_600 }); // October 31, 2026
        segments[31] = getSegment({ amount: 3566e18, milestone: 1_795_989_600 }); // November 30, 2026
        segments[32] = getSegment({ amount: 3763e18, milestone: 1_798_668_000 }); // December 31, 2026
        segments[33] = getSegment({ amount: 3967e18, milestone: 1_801_346_400 }); // January 31, 2027
        segments[34] = getSegment({ amount: 4166e18, milestone: 1_803_765_600 }); // February 28, 2027
        segments[35] = getSegment({ amount: 4379e18, milestone: 1_806_440_400 }); // March 31, 2027
        segments[36] = getSegment({ amount: 4563e18, milestone: 1_809_032_400 }); // April 30, 2027
        return segments;
    }

    function getSegmentsForUser11() public pure returns (LockupDynamic.Segment[] memory) {
        LockupDynamic.Segment[] memory segments = new LockupDynamic.Segment[](36);
        segments[0] = getSegment({ amount: 7790e18, milestone: 1_706_652_000 }); // January 31, 2024
        segments[1] = getSegment({ amount: 16_059e18, milestone: 1_709_157_600 }); // February 29, 2024
        segments[2] = getSegment({ amount: 24_857e18, milestone: 1_711_836_000 }); // March 31, 2024
        segments[3] = getSegment({ amount: 34_134e18, milestone: 1_714_424_400 }); // April 30, 2024
        segments[4] = getSegment({ amount: 43_948e18, milestone: 1_717_102_800 }); // May 31, 2024
        segments[5] = getSegment({ amount: 54_225e18, milestone: 1_719_694_800 }); // June 30, 2024
        segments[6] = getSegment({ amount: 63_378e18, milestone: 1_722_373_200 }); // July 31, 2024
        segments[7] = getSegment({ amount: 72_432e18, milestone: 1_725_051_600 }); // August 31, 2024
        segments[8] = getSegment({ amount: 81_486e18, milestone: 1_727_643_600 }); // September 30, 2024
        segments[9] = getSegment({ amount: 90_540e18, milestone: 1_730_325_600 }); // October 31, 2024
        segments[10] = getSegment({ amount: 99_594e18, milestone: 1_732_917_600 }); // November 30, 2024
        segments[11] = getSegment({ amount: 108_648e18, milestone: 1_735_596_000 }); // December 31, 2024
        segments[12] = getSegment({ amount: 117_702e18, milestone: 1_738_274_400 }); // January 31, 2025
        segments[13] = getSegment({ amount: 126_756e18, milestone: 1_740_693_600 }); // February 28, 2025
        segments[14] = getSegment({ amount: 135_811e18, milestone: 1_743_368_400 }); // March 31, 2025
        segments[15] = getSegment({ amount: 144_865e18, milestone: 1_745_960_400 }); // April 30, 2025
        segments[16] = getSegment({ amount: 153_919e18, milestone: 1_748_638_800 }); // May 31, 2025
        segments[17] = getSegment({ amount: 162_973e18, milestone: 1_751_230_800 }); // June 30, 2025
        segments[18] = getSegment({ amount: 172_027e18, milestone: 1_753_909_200 }); // July 31, 2025
        segments[19] = getSegment({ amount: 181_081e18, milestone: 1_756_587_600 }); // August 31, 2025
        segments[20] = getSegment({ amount: 190_135e18, milestone: 1_759_179_600 }); // September 30, 2025
        segments[21] = getSegment({ amount: 199_189e18, milestone: 1_761_861_600 }); // October 31, 2025
        segments[22] = getSegment({ amount: 208_243e18, milestone: 1_764_453_600 }); // November 30, 2025
        segments[23] = getSegment({ amount: 217_297e18, milestone: 1_767_132_000 }); // December 31, 2025
        segments[24] = getSegment({ amount: 226_351e18, milestone: 1_769_810_400 }); // January 31, 2026
        segments[25] = getSegment({ amount: 235_405e18, milestone: 1_772_229_600 }); // February 28, 2026
        segments[26] = getSegment({ amount: 244_459e18, milestone: 1_774_904_400 }); // March 31, 2026
        segments[27] = getSegment({ amount: 253_513e18, milestone: 1_777_496_400 }); // April 30, 2026
        segments[28] = getSegment({ amount: 262_567e18, milestone: 1_780_174_800 }); // May 31, 2026
        segments[29] = getSegment({ amount: 271_621e18, milestone: 1_782_766_800 }); // June 30, 2026
        segments[30] = getSegment({ amount: 280_675e18, milestone: 1_785_445_200 }); // July 31, 2026
        segments[31] = getSegment({ amount: 289_729e18, milestone: 1_788_123_600 }); // August 31, 2026
        segments[32] = getSegment({ amount: 298_783e18, milestone: 1_790_715_600 }); // September 30, 2026
        segments[33] = getSegment({ amount: 307_837e18, milestone: 1_793_397_600 }); // October 31, 2026
        segments[34] = getSegment({ amount: 316_891e18, milestone: 1_795_989_600 }); // November 30, 2026
        segments[35] = getSegment({ amount: 325_945e18, milestone: 1_798_668_000 }); // December 31, 2026
        return segments;
    }

    function getSegmentsForUser12() public pure returns (LockupDynamic.Segment[] memory) {
        LockupDynamic.Segment[] memory segments = new LockupDynamic.Segment[](36);
        segments[0] = getSegment({ amount: 31_160e18, milestone: 1_706_652_000 }); // January 31, 2024
        segments[1] = getSegment({ amount: 64_237e18, milestone: 1_709_157_600 }); // February 29, 2024
        segments[2] = getSegment({ amount: 99_429e18, milestone: 1_711_836_000 }); // March 31, 2024
        segments[3] = getSegment({ amount: 136_537e18, milestone: 1_714_424_400 }); // April 30, 2024
        segments[4] = getSegment({ amount: 175_794e18, milestone: 1_717_102_800 }); // May 31, 2024
        segments[5] = getSegment({ amount: 216_900e18, milestone: 1_719_694_800 }); // June 30, 2024
        segments[6] = getSegment({ amount: 253_513e18, milestone: 1_722_373_200 }); // July 31, 2024
        segments[7] = getSegment({ amount: 289_729e18, milestone: 1_725_051_600 }); // August 31, 2024
        segments[8] = getSegment({ amount: 325_945e18, milestone: 1_727_643_600 }); // September 30, 2024
        segments[9] = getSegment({ amount: 362_161e18, milestone: 1_730_325_600 }); // October 31, 2024
        segments[10] = getSegment({ amount: 398_377e18, milestone: 1_732_917_600 }); // November 30, 2024
        segments[11] = getSegment({ amount: 434_593e18, milestone: 1_735_596_000 }); // December 31, 2024
        segments[12] = getSegment({ amount: 470_809e18, milestone: 1_738_274_400 }); // January 31, 2025
        segments[13] = getSegment({ amount: 507_026e18, milestone: 1_740_693_600 }); // February 28, 2025
        segments[14] = getSegment({ amount: 543_242e18, milestone: 1_743_368_400 }); // March 31, 2025
        segments[15] = getSegment({ amount: 579_458e18, milestone: 1_745_960_400 }); // April 30, 2025
        segments[16] = getSegment({ amount: 615_674e18, milestone: 1_748_638_800 }); // May 31, 2025
        segments[17] = getSegment({ amount: 651_890e18, milestone: 1_751_230_800 }); // June 30, 2025
        segments[18] = getSegment({ amount: 688_106e18, milestone: 1_753_909_200 }); // July 31, 2025
        segments[19] = getSegment({ amount: 724_322e18, milestone: 1_756_587_600 }); // August 31, 2025
        segments[20] = getSegment({ amount: 760_538e18, milestone: 1_759_179_600 }); // September 30, 2025
        segments[21] = getSegment({ amount: 796_754e18, milestone: 1_761_861_600 }); // October 31, 2025
        segments[22] = getSegment({ amount: 832_971e18, milestone: 1_764_453_600 }); // November 30, 2025
        segments[23] = getSegment({ amount: 869_187e18, milestone: 1_767_132_000 }); // December 31, 2025
        segments[24] = getSegment({ amount: 905_403e18, milestone: 1_769_810_400 }); // January 31, 2026
        segments[25] = getSegment({ amount: 941_619e18, milestone: 1_772_229_600 }); // February 28, 2026
        segments[26] = getSegment({ amount: 977_835e18, milestone: 1_774_904_400 }); // March 31, 2026
        segments[27] = getSegment({ amount: 1_014_051e18, milestone: 1_777_496_400 }); // April 30, 2026
        segments[28] = getSegment({ amount: 1_050_267e18, milestone: 1_780_174_800 }); // May 31, 2026
        segments[29] = getSegment({ amount: 1_086_483e18, milestone: 1_782_766_800 }); // June 30, 2026
        segments[30] = getSegment({ amount: 1_122_699e18, milestone: 1_785_445_200 }); // July 31, 2026
        segments[31] = getSegment({ amount: 1_158_916e18, milestone: 1_788_123_600 }); // August 31, 2026
        segments[32] = getSegment({ amount: 1_195_132e18, milestone: 1_790_715_600 }); // September 30, 2026
        segments[33] = getSegment({ amount: 1_231_348e18, milestone: 1_793_397_600 }); // October 31, 2026
        segments[34] = getSegment({ amount: 1_267_564e18, milestone: 1_795_989_600 }); // November 30, 2026
        segments[35] = getSegment({ amount: 1_303_780e18, milestone: 1_798_668_000 }); // December 31, 2026
        return segments;
    }

    function getSegmentsForUser13() public pure returns (LockupDynamic.Segment[] memory) {
        LockupDynamic.Segment[] memory segments = new LockupDynamic.Segment[](36);
        segments[0] = getSegment({ amount: 807e18, milestone: 1_706_652_000 }); // January 31, 2024
        segments[1] = getSegment({ amount: 1665e18, milestone: 1_709_157_600 }); // February 29, 2024
        segments[2] = getSegment({ amount: 2579e18, milestone: 1_711_836_000 }); // March 31, 2024
        segments[3] = getSegment({ amount: 3545e18, milestone: 1_714_424_400 }); // April 30, 2024
        segments[4] = getSegment({ amount: 4567e18, milestone: 1_717_102_800 }); // May 31, 2024
        segments[5] = getSegment({ amount: 5639e18, milestone: 1_719_694_800 }); // June 30, 2024
        segments[6] = getSegment({ amount: 6770e18, milestone: 1_722_373_200 }); // July 31, 2024
        segments[7] = getSegment({ amount: 7955e18, milestone: 1_725_051_600 }); // August 31, 2024
        segments[8] = getSegment({ amount: 9187e18, milestone: 1_727_643_600 }); // September 30, 2024
        segments[9] = getSegment({ amount: 10_481e18, milestone: 1_730_325_600 }); // October 31, 2024
        segments[10] = getSegment({ amount: 11_819e18, milestone: 1_732_917_600 }); // November 30, 2024
        segments[11] = getSegment({ amount: 13_221e18, milestone: 1_735_596_000 }); // December 31, 2024
        segments[12] = getSegment({ amount: 14_677e18, milestone: 1_738_274_400 }); // January 31, 2025
        segments[13] = getSegment({ amount: 16_151e18, milestone: 1_740_693_600 }); // February 28, 2025
        segments[14] = getSegment({ amount: 17_714e18, milestone: 1_743_368_400 }); // March 31, 2025
        segments[15] = getSegment({ amount: 19_318e18, milestone: 1_745_960_400 }); // April 30, 2025
        segments[16] = getSegment({ amount: 20_989e18, milestone: 1_748_638_800 }); // May 31, 2025
        segments[17] = getSegment({ amount: 22_699e18, milestone: 1_751_230_800 }); // June 30, 2025
        segments[18] = getSegment({ amount: 24_428e18, milestone: 1_753_909_200 }); // July 31, 2025
        segments[19] = getSegment({ amount: 25_713e18, milestone: 1_756_587_600 }); // August 31, 2025
        segments[20] = getSegment({ amount: 26_999e18, milestone: 1_759_179_600 }); // September 30, 2025
        segments[21] = getSegment({ amount: 28_285e18, milestone: 1_761_861_600 }); // October 31, 2025
        segments[22] = getSegment({ amount: 29_570e18, milestone: 1_764_453_600 }); // November 30, 2025
        segments[23] = getSegment({ amount: 30_856e18, milestone: 1_767_132_000 }); // December 31, 2025
        segments[24] = getSegment({ amount: 32_142e18, milestone: 1_769_810_400 }); // January 31, 2026
        segments[25] = getSegment({ amount: 33_427e18, milestone: 1_772_229_600 }); // February 28, 2026
        segments[26] = getSegment({ amount: 34_713e18, milestone: 1_774_904_400 }); // March 31, 2026
        segments[27] = getSegment({ amount: 35_999e18, milestone: 1_777_496_400 }); // April 30, 2026
        segments[28] = getSegment({ amount: 37_285e18, milestone: 1_780_174_800 }); // May 31, 2026
        segments[29] = getSegment({ amount: 38_570e18, milestone: 1_782_766_800 }); // June 30, 2026
        segments[30] = getSegment({ amount: 39_856e18, milestone: 1_785_445_200 }); // July 31, 2026
        segments[31] = getSegment({ amount: 41_142e18, milestone: 1_788_123_600 }); // August 31, 2026
        segments[32] = getSegment({ amount: 42_427e18, milestone: 1_790_715_600 }); // September 30, 2026
        segments[33] = getSegment({ amount: 43_713e18, milestone: 1_793_397_600 }); // October 31, 2026
        segments[34] = getSegment({ amount: 44_999e18, milestone: 1_795_989_600 }); // November 30, 2026
        segments[35] = getSegment({ amount: 46_284e18, milestone: 1_798_668_000 }); // December 31, 2026
        return segments;
    }

    function getSegmentsForUser14() public pure returns (LockupDynamic.Segment[] memory) {
        LockupDynamic.Segment[] memory segments = new LockupDynamic.Segment[](36);
        segments[0] = getSegment({ amount: 397e18, milestone: 1_706_652_000 }); // January 31, 2024
        segments[1] = getSegment({ amount: 820e18, milestone: 1_709_157_600 }); // February 29, 2024
        segments[2] = getSegment({ amount: 1271e18, milestone: 1_711_836_000 }); // March 31, 2024
        segments[3] = getSegment({ amount: 1748e18, milestone: 1_714_424_400 }); // April 30, 2024
        segments[4] = getSegment({ amount: 2253e18, milestone: 1_717_102_800 }); // May 31, 2024
        segments[5] = getSegment({ amount: 2783e18, milestone: 1_719_694_800 }); // June 30, 2024
        segments[6] = getSegment({ amount: 3342e18, milestone: 1_722_373_200 }); // July 31, 2024
        segments[7] = getSegment({ amount: 3928e18, milestone: 1_725_051_600 }); // August 31, 2024
        segments[8] = getSegment({ amount: 4538e18, milestone: 1_727_643_600 }); // September 30, 2024
        segments[9] = getSegment({ amount: 5179e18, milestone: 1_730_325_600 }); // October 31, 2024
        segments[10] = getSegment({ amount: 5842e18, milestone: 1_732_917_600 }); // November 30, 2024
        segments[11] = getSegment({ amount: 6537e18, milestone: 1_735_596_000 }); // December 31, 2024
        segments[12] = getSegment({ amount: 7259e18, milestone: 1_738_274_400 }); // January 31, 2025
        segments[13] = getSegment({ amount: 7989e18, milestone: 1_740_693_600 }); // February 28, 2025
        segments[14] = getSegment({ amount: 8765e18, milestone: 1_743_368_400 }); // March 31, 2025
        segments[15] = getSegment({ amount: 9560e18, milestone: 1_745_960_400 }); // April 30, 2025
        segments[16] = getSegment({ amount: 10_390e18, milestone: 1_748_638_800 }); // May 31, 2025
        segments[17] = getSegment({ amount: 11_238e18, milestone: 1_751_230_800 }); // June 30, 2025
        segments[18] = getSegment({ amount: 12_122e18, milestone: 1_753_909_200 }); // July 31, 2025
        segments[19] = getSegment({ amount: 12_857e18, milestone: 1_756_587_600 }); // August 31, 2025
        segments[20] = getSegment({ amount: 13_500e18, milestone: 1_759_179_600 }); // September 30, 2025
        segments[21] = getSegment({ amount: 14_142e18, milestone: 1_761_861_600 }); // October 31, 2025
        segments[22] = getSegment({ amount: 14_785e18, milestone: 1_764_453_600 }); // November 30, 2025
        segments[23] = getSegment({ amount: 15_428e18, milestone: 1_767_132_000 }); // December 31, 2025
        segments[24] = getSegment({ amount: 16_071e18, milestone: 1_769_810_400 }); // January 31, 2026
        segments[25] = getSegment({ amount: 16_714e18, milestone: 1_772_229_600 }); // February 28, 2026
        segments[26] = getSegment({ amount: 17_357e18, milestone: 1_774_904_400 }); // March 31, 2026
        segments[27] = getSegment({ amount: 17_999e18, milestone: 1_777_496_400 }); // April 30, 2026
        segments[28] = getSegment({ amount: 18_642e18, milestone: 1_780_174_800 }); // May 31, 2026
        segments[29] = getSegment({ amount: 19_285e18, milestone: 1_782_766_800 }); // June 30, 2026
        segments[30] = getSegment({ amount: 19_928e18, milestone: 1_785_445_200 }); // July 31, 2026
        segments[31] = getSegment({ amount: 20_571e18, milestone: 1_788_123_600 }); // August 31, 2026
        segments[32] = getSegment({ amount: 21_214e18, milestone: 1_790_715_600 }); // September 30, 2026
        segments[33] = getSegment({ amount: 21_856e18, milestone: 1_793_397_600 }); // October 31, 2026
        segments[34] = getSegment({ amount: 22_499e18, milestone: 1_795_989_600 }); // November 30, 2026
        segments[35] = getSegment({ amount: 23_142e18, milestone: 1_798_668_000 }); // December 31, 2026
        return segments;
    }

    function getSegmentsForUser15() public pure returns (LockupDynamic.Segment[] memory) {
        LockupDynamic.Segment[] memory segments = new LockupDynamic.Segment[](36);
        segments[0] = getSegment({ amount: 808e18, milestone: 1_706_652_000 }); // January 31, 2024
        segments[1] = getSegment({ amount: 1667e18, milestone: 1_709_157_600 }); // February 29, 2024
        segments[2] = getSegment({ amount: 2582e18, milestone: 1_711_836_000 }); // March 31, 2024
        segments[3] = getSegment({ amount: 3548e18, milestone: 1_714_424_400 }); // April 30, 2024
        segments[4] = getSegment({ amount: 4572e18, milestone: 1_717_102_800 }); // May 31, 2024
        segments[5] = getSegment({ amount: 5644e18, milestone: 1_719_694_800 }); // June 30, 2024
        segments[6] = getSegment({ amount: 6776e18, milestone: 1_722_373_200 }); // July 31, 2024
        segments[7] = getSegment({ amount: 7962e18, milestone: 1_725_051_600 }); // August 31, 2024
        segments[8] = getSegment({ amount: 9195e18, milestone: 1_727_643_600 }); // September 30, 2024
        segments[9] = getSegment({ amount: 10_490e18, milestone: 1_730_325_600 }); // October 31, 2024
        segments[10] = getSegment({ amount: 11_829e18, milestone: 1_732_917_600 }); // November 30, 2024
        segments[11] = getSegment({ amount: 13_232e18, milestone: 1_735_596_000 }); // December 31, 2024
        segments[12] = getSegment({ amount: 14_689e18, milestone: 1_738_274_400 }); // January 31, 2025
        segments[13] = getSegment({ amount: 16_164e18, milestone: 1_740_693_600 }); // February 28, 2025
        segments[14] = getSegment({ amount: 17_728e18, milestone: 1_743_368_400 }); // March 31, 2025
        segments[15] = getSegment({ amount: 19_332e18, milestone: 1_745_960_400 }); // April 30, 2025
        segments[16] = getSegment({ amount: 21_004e18, milestone: 1_748_638_800 }); // May 31, 2025
        segments[17] = getSegment({ amount: 22_714e18, milestone: 1_751_230_800 }); // June 30, 2025
        segments[18] = getSegment({ amount: 24_428e18, milestone: 1_753_909_200 }); // July 31, 2025
        segments[19] = getSegment({ amount: 25_713e18, milestone: 1_756_587_600 }); // August 31, 2025
        segments[20] = getSegment({ amount: 26_999e18, milestone: 1_759_179_600 }); // September 30, 2025
        segments[21] = getSegment({ amount: 28_285e18, milestone: 1_761_861_600 }); // October 31, 2025
        segments[22] = getSegment({ amount: 29_570e18, milestone: 1_764_453_600 }); // November 30, 2025
        segments[23] = getSegment({ amount: 30_856e18, milestone: 1_767_132_000 }); // December 31, 2025
        segments[24] = getSegment({ amount: 32_142e18, milestone: 1_769_810_400 }); // January 31, 2026
        segments[25] = getSegment({ amount: 33_427e18, milestone: 1_772_229_600 }); // February 28, 2026
        segments[26] = getSegment({ amount: 34_713e18, milestone: 1_774_904_400 }); // March 31, 2026
        segments[27] = getSegment({ amount: 35_999e18, milestone: 1_777_496_400 }); // April 30, 2026
        segments[28] = getSegment({ amount: 37_285e18, milestone: 1_780_174_800 }); // May 31, 2026
        segments[29] = getSegment({ amount: 38_570e18, milestone: 1_782_766_800 }); // June 30, 2026
        segments[30] = getSegment({ amount: 39_856e18, milestone: 1_785_445_200 }); // July 31, 2026
        segments[31] = getSegment({ amount: 41_142e18, milestone: 1_788_123_600 }); // August 31, 2026
        segments[32] = getSegment({ amount: 42_427e18, milestone: 1_790_715_600 }); // September 30, 2026
        segments[33] = getSegment({ amount: 43_713e18, milestone: 1_793_397_600 }); // October 31, 2026
        segments[34] = getSegment({ amount: 44_999e18, milestone: 1_795_989_600 }); // November 30, 2026
        segments[35] = getSegment({ amount: 46_284e18, milestone: 1_798_668_000 }); // December 31, 2026
        return segments;
    }

    function getSegmentsForUser16() public pure returns (LockupDynamic.Segment[] memory) {
        LockupDynamic.Segment[] memory segments = new LockupDynamic.Segment[](36);
        segments[0] = getSegment({ amount: 68e18, milestone: 1_727_643_600 }); // September 30, 2024
        segments[1] = getSegment({ amount: 148e18, milestone: 1_730_325_600 }); // October 31, 2024
        segments[2] = getSegment({ amount: 239e18, milestone: 1_732_917_600 }); // November 30, 2024
        segments[3] = getSegment({ amount: 341e18, milestone: 1_735_596_000 }); // December 31, 2024
        segments[4] = getSegment({ amount: 455e18, milestone: 1_738_274_400 }); // January 31, 2025
        segments[5] = getSegment({ amount: 580e18, milestone: 1_740_693_600 }); // February 28, 2025
        segments[6] = getSegment({ amount: 717e18, milestone: 1_743_368_400 }); // March 31, 2025
        segments[7] = getSegment({ amount: 865e18, milestone: 1_745_960_400 }); // April 30, 2025
        segments[8] = getSegment({ amount: 1024e18, milestone: 1_748_638_800 }); // May 31, 2025
        segments[9] = getSegment({ amount: 1195e18, milestone: 1_751_230_800 }); // June 30, 2025
        segments[10] = getSegment({ amount: 1377e18, milestone: 1_753_909_200 }); // July 31, 2025
        segments[11] = getSegment({ amount: 1570e18, milestone: 1_756_587_600 }); // August 31, 2025
        segments[12] = getSegment({ amount: 1775e18, milestone: 1_759_179_600 }); // September 30, 2025
        segments[13] = getSegment({ amount: 1991e18, milestone: 1_761_861_600 }); // October 31, 2025
        segments[14] = getSegment({ amount: 2219e18, milestone: 1_764_453_600 }); // November 30, 2025
        segments[15] = getSegment({ amount: 2458e18, milestone: 1_767_132_000 }); // December 31, 2025
        segments[16] = getSegment({ amount: 2708e18, milestone: 1_769_810_400 }); // January 31, 2026
        segments[17] = getSegment({ amount: 2970e18, milestone: 1_772_229_600 }); // February 28, 2026
        segments[18] = getSegment({ amount: 3243e18, milestone: 1_774_904_400 }); // March 31, 2026
        segments[19] = getSegment({ amount: 3527e18, milestone: 1_777_496_400 }); // April 30, 2026
        segments[20] = getSegment({ amount: 3823e18, milestone: 1_780_174_800 }); // May 31, 2026
        segments[21] = getSegment({ amount: 4130e18, milestone: 1_782_766_800 }); // June 30, 2026
        segments[22] = getSegment({ amount: 4449e18, milestone: 1_785_445_200 }); // July 31, 2026
        segments[23] = getSegment({ amount: 4779e18, milestone: 1_788_123_600 }); // August 31, 2026
        segments[24] = getSegment({ amount: 5120e18, milestone: 1_790_715_600 }); // September 30, 2026
        segments[25] = getSegment({ amount: 5473e18, milestone: 1_793_397_600 }); // October 31, 2026
        segments[26] = getSegment({ amount: 5837e18, milestone: 1_795_989_600 }); // November 30, 2026
        segments[27] = getSegment({ amount: 6213e18, milestone: 1_798_668_000 }); // December 31, 2026
        segments[28] = getSegment({ amount: 6599e18, milestone: 1_801_346_400 }); // January 31, 2027
        segments[29] = getSegment({ amount: 6998e18, milestone: 1_803_765_600 }); // February 28, 2027
        segments[30] = getSegment({ amount: 7407e18, milestone: 1_806_440_400 }); // March 31, 2027
        segments[31] = getSegment({ amount: 7828e18, milestone: 1_809_032_400 }); // April 30, 2027
        segments[32] = getSegment({ amount: 8261e18, milestone: 1_811_710_800 }); // May 31, 2027
        segments[33] = getSegment({ amount: 8704e18, milestone: 1_814_302_800 }); // June 30, 2027
        segments[34] = getSegment({ amount: 9160e18, milestone: 1_816_981_200 }); // July 31, 2027
        segments[35] = getSegment({ amount: 9626e18, milestone: 1_819_659_600 }); // August 31, 2027
        segments[36] = getSegment({ amount: 10_104e18, milestone: 1_822_251_600 }); // September 30, 2027
        return segments;
    }
}
