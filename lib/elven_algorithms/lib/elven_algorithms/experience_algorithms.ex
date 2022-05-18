defmodule ElvenAlgorithms.ExperienceAlgorithms do
  @moduledoc """
  TODO: Documentation
  """

  import ElvenAlgorithms

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
end
