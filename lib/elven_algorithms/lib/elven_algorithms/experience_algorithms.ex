defmodule ElvenAlgorithms.ExperienceAlgorithms do
  @moduledoc """
  TODO: Documentation
  """

  import ElvenAlgorithms

  @fairy_max_level 80

  ## Experience Algorithm

  @xp_constant List.flatten([
                 [300, 840, 1800, 3300, 5460, 8400, 12240, 17100, 23100, 30360, 39000, 49140],
                 [60900, 74400, 105_120, 139_800, 178_680, 222_000, 270_000, 322_920, 381_000],
                 [444_480, 513_600, 588_600, 669_720, 757_200, 851_280, 952_200, 1_060_200],
                 [1_175_520, 1_298_400, 1_429_080, 1_567_800, 1_714_800, 1_870_320, 2_034_600],
                 [2_207_880, 2_390_400, 2_582_400, 3_221_180, 3_891_500, 4_594_120, 5_329_800],
                 [6_099_300, 6_903_380, 7_742_800, 8_618_320, 9_530_700, 10_480_700, 11_469_080],
                 [12_496_600, 13_564_020, 14_672_100, 15_821_600, 17_013_280, 18_247_900],
                 [19_526_220, 20_849_000, 22_217_000, 27_426_400, 32_808_000, 38_364_600],
                 [44_099_000, 50_014_000, 56_112_400, 62_397_000, 68_870_600, 75_536_000],
                 [82_396_000, 89_453_400, 96_711_000, 104_171_600, 111_838_000, 119_713_000],
                 [127_799_400, 136_100_000, 144_617_600, 153_355_000, 162_315_000, 195_120_000],
                 [228_740_000, 263_185_000, 326_689_000, 391_714_000, 487_862_000, 586_259_000],
                 [686_931_000, 789_904_000, 895_204_000, 1_002_857_000, 1_112_889_000],
                 [1_225_326_000, 1_340_194_000, 1_457_519_000, 1_577_327_000, 1_699_644_000],
                 [1_843_704_000, 1_990_719_000, 2_140_719_000]
               ])

  @job_exp_constant List.flatten([
                      [14500, 19000, 23500, 28000, 32500, 37000, 41500],
                      [46000, 50500, 55000, 59500, 64000, 68500, 73000],
                      [77500, 82000, 86500, 91000, 95500, 100_000, 104_500],
                      [109_000, 113_500, 118_000, 122_500, 127_000, 131_500],
                      [136_000, 140_500, 145_000, 149_500, 154_000, 158_500],
                      [163_000, 167_500, 172_000, 176_500, 181_000],
                      [185_500, 190_000, 205_000, 220_000, 235_000, 250_000],
                      [265_000, 280_000, 295_000, 310_000, 325_000, 340_000],
                      [355_000, 370_000, 385_000, 400_000, 415_000, 430_000],
                      [445_000, 460_000, 475_000, 490_000, 505_000, 520_000],
                      [535_000, 550_000, 565_000, 580_000, 595_000, 610_000],
                      [625_000, 640_000, 655_000, 670_000, 685_000, 700_000],
                      [715_000, 730_000, 745_000, 760_000, 775_000, 790_000]
                    ])

  @hero_exp_constant List.flatten([
                       [949_560, 1_068_540, 1_197_000, 1_335_300, 1_483_800, 1_642_860],
                       [1_812_840, 1_994_100, 2_187_000, 2_391_900, 2_609_160, 2_839_110],
                       [3_082_080, 3_338_400, 3_608_400, 3_892_410, 4_190_760, 4_503_780],
                       [4_831_800, 5_175_150, 5_534_160, 5_909_100, 6_300_240, 6_707_850],
                       [7_132_200, 7_573_560, 8_032_200, 8_508_390, 9_002_400, 9_514_500],
                       [10_044_960, 10_594_020, 11_161_920, 11_748_900, 12_355_200, 12_981_060],
                       [13_626_720, 14_292_420, 14_978_400, 15_684_900, 16_412_160, 17_160_390],
                       [17_929_800, 18_720_600, 19_533_000, 20_367_210, 21_223_440, 22_101_900],
                       [23_002_800, 23_926_350, 24_872_760, 25_842_210, 26_834_880, 27_850_950],
                       [33_224_190, 38_207_818, 43_938_990, 50_529_838, 58_109_313, 66_825_709]
                     ])

  @specialist_exp_constant List.flatten([
                             [15000, 25000, 35000, 45000, 55000, 65000, 75000, 85000],
                             [95000, 105_000, 115_000, 125_000, 135_000, 145_000, 155_000],
                             [165_000, 175_000, 185_000, 195_000, 218_000, 225_566, 233_888],
                             [243_002, 252_944, 263_750, 275_456, 288_098, 301_712, 316_334],
                             [332_000, 348_746, 366_608, 385_622, 405_824, 427_250, 449_936],
                             [473_918, 499_232, 525_914, 554_000, 583_526, 614_528, 647_042],
                             [681_104, 716_750, 754_016, 792_938, 833_552, 875_894, 920_000],
                             [965_906, 1_013_648, 1_063_262, 1_114_784, 1_168_250, 1_223_696],
                             [1_281_158, 1_340_672, 1_402_274, 1_466_000, 1_531_886, 1_599_968],
                             [1_670_282, 1_742_864, 1_817_750, 1_894_976, 1_974_578, 2_056_592],
                             [2_141_054, 2_228_000, 2_317_466, 2_409_488, 2_504_102, 2_601_344],
                             [2_701_250, 2_803_856, 2_909_198, 3_017_312, 3_128_234, 3_242_000],
                             [3_358_646, 3_478_208, 3_600_722, 3_726_224, 3_854_750, 3_986_336],
                             [4_121_018, 4_258_832, 4_399_814, 4_544_000, 4_691_426, 4_842_128],
                             [4_996_142, 5_153_504, 5_314_250, 5_478_416, 5_646_038, 5_817_152],
                             [5_991_794]
                           ])

  for {constant, level} <- Enum.with_index(@xp_constant, 1) do
    def exp(unquote(level)) do
      unquote(constant)
    end
  end

  for {constant, level} <- Enum.with_index(@job_exp_constant, 1) do
    def job_exp(unquote(level)) do
      unquote(constant)
    end
  end

  for {constant, level} <- Enum.with_index(@hero_exp_constant, 1) do
    def hero_exp(unquote(level)) do
      unquote(constant)
    end
  end

  for {constant, level} <- Enum.with_index(@specialist_exp_constant, 1) do
    def specialist_exp(unquote(level)) do
      unquote(constant)
    end
  end

  for level <- 0..@fairy_max_level do
    fairy_xp = if level < 40, do: level * level + 50, else: (level * level + 50) * 3

    def fairy_exp(unquote(level)) do
      unquote(fairy_xp)
    end
  end
end
