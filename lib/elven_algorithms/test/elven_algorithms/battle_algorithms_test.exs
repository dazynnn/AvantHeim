defmodule ElvenAlgorithms.BattleAlgorithmsTest do
  use ExUnit.Case

  alias ElvenAlgorithms.BattleAlgorithms

  ## Tests

  describe "hp_max/2 for" do
    test "adventurer" do
      Enum.each(adventurer_hp_max(), fn {level, hp} ->
        assert BattleAlgorithms.hp_max(:adventurer, level) == hp
      end)
    end

    test "swordman" do
      Enum.each(swordman_hp_max(), fn {level, hp} ->
        assert BattleAlgorithms.hp_max(:swordman, level) == hp
      end)
    end

    test "archer" do
      Enum.each(archer_hp_max(), fn {level, hp} ->
        assert BattleAlgorithms.hp_max(:archer, level) == hp
      end)
    end

    test "magician" do
      Enum.each(magician_hp_max(), fn {level, hp} ->
        assert BattleAlgorithms.hp_max(:magician, level) == hp
      end)
    end

    test "martial_artist" do
      Enum.each(martial_artist_hp_max(), fn {level, hp} ->
        assert BattleAlgorithms.hp_max(:martial_artist, level) == hp
      end)
    end
  end

  ## Helpers

  def adventurer_hp_max() do
    [
      {1, 221},
      {2, 238},
      {3, 256},
      {4, 275},
      {5, 295},
      {6, 316},
      {7, 338},
      {8, 361},
      {9, 385},
      {10, 410},
      {11, 436},
      {12, 463},
      {13, 491},
      {14, 520},
      {15, 550},
      {16, 581},
      {17, 613},
      {18, 646},
      {19, 680},
      {20, 715},
      {21, 751},
      {22, 788},
      {23, 826},
      {24, 865},
      {25, 905},
      {26, 946},
      {27, 988},
      {28, 1031},
      {29, 1075},
      {30, 1120},
      {31, 1166},
      {32, 1213},
      {33, 1261},
      {34, 1310},
      {35, 1360},
      {36, 1411},
      {37, 1463},
      {38, 1516},
      {39, 1570},
      {40, 1625},
      {41, 1681},
      {42, 1738},
      {43, 1796},
      {44, 1855},
      {45, 1915},
      {46, 1976},
      {47, 2038},
      {48, 2101},
      {49, 2165},
      {50, 2230},
      {51, 2296},
      {52, 2363},
      {53, 2431},
      {54, 2500},
      {55, 2570},
      {56, 2641},
      {57, 2713},
      {58, 2786},
      {59, 2860},
      {60, 2935},
      {61, 3011},
      {62, 3088},
      {63, 3166},
      {64, 3245},
      {65, 3325},
      {66, 3406},
      {67, 3488},
      {68, 3571},
      {69, 3655},
      {70, 3740},
      {71, 3826},
      {72, 3913},
      {73, 4001},
      {74, 4090},
      {75, 4180},
      {76, 4271},
      {77, 4363},
      {78, 4456},
      {79, 4550},
      {80, 4645},
      {81, 4741},
      {82, 4838},
      {83, 4936},
      {84, 5035},
      {85, 5135},
      {86, 5236},
      {87, 5338},
      {88, 5441},
      {89, 5545},
      {90, 5650},
      {91, 5756},
      {92, 5863},
      {93, 5971},
      {94, 6080},
      {95, 6190},
      {96, 6301},
      {97, 6413},
      {98, 6526},
      {99, 6640}
    ]
  end

  def swordman_hp_max() do
    [
      {1, 221},
      {2, 238},
      {3, 275},
      {4, 316},
      {5, 361},
      {6, 410},
      {7, 436},
      {8, 491},
      {9, 550},
      {10, 613},
      {11, 680},
      {12, 715},
      {13, 788},
      {14, 865},
      {15, 946},
      {16, 1031},
      {17, 1075},
      {18, 1166},
      {19, 1261},
      {20, 1360},
      {21, 1463},
      {22, 1516},
      {23, 1625},
      {24, 1738},
      {25, 1855},
      {26, 1976},
      {27, 2038},
      {28, 2165},
      {29, 2296},
      {30, 2431},
      {31, 2570},
      {32, 2641},
      {33, 2786},
      {34, 2935},
      {35, 3088},
      {36, 3245},
      {37, 3325},
      {38, 3488},
      {39, 3655},
      {40, 3826},
      {41, 4001},
      {42, 4090},
      {43, 4271},
      {44, 4456},
      {45, 4645},
      {46, 4838},
      {47, 4936},
      {48, 5135},
      {49, 5338},
      {50, 5545},
      {51, 5756},
      {52, 5863},
      {53, 6080},
      {54, 6301},
      {55, 6526},
      {56, 6755},
      {57, 6871},
      {58, 7106},
      {59, 7345},
      {60, 7588},
      {61, 7835},
      {62, 7960},
      {63, 8213},
      {64, 8470},
      {65, 8731},
      {66, 8996},
      {67, 9130},
      {68, 9401},
      {69, 9676},
      {70, 9955},
      {71, 10238},
      {72, 10381},
      {73, 10670},
      {74, 10963},
      {75, 11260},
      {76, 11561},
      {77, 11713},
      {78, 12020},
      {79, 12331},
      {80, 12646},
      {81, 12965},
      {82, 13126},
      {83, 13451},
      {84, 13780},
      {85, 14113},
      {86, 14450},
      {87, 14620},
      {88, 14963},
      {89, 15310},
      {90, 15661},
      {91, 16016},
      {92, 16195},
      {93, 16556},
      {94, 16921},
      {95, 17290},
      {96, 17663},
      {97, 17851},
      {98, 18230},
      {99, 18613}
    ]
  end

  def archer_hp_max() do
    [
      {1, 221},
      {2, 238},
      {3, 256},
      {4, 275},
      {5, 316},
      {6, 338},
      {7, 361},
      {8, 410},
      {9, 436},
      {10, 463},
      {11, 520},
      {12, 550},
      {13, 581},
      {14, 613},
      {15, 680},
      {16, 715},
      {17, 751},
      {18, 826},
      {19, 865},
      {20, 905},
      {21, 988},
      {22, 1031},
      {23, 1075},
      {24, 1120},
      {25, 1213},
      {26, 1261},
      {27, 1310},
      {28, 1411},
      {29, 1463},
      {30, 1516},
      {31, 1625},
      {32, 1681},
      {33, 1738},
      {34, 1796},
      {35, 1915},
      {36, 1976},
      {37, 2038},
      {38, 2165},
      {39, 2230},
      {40, 2296},
      {41, 2431},
      {42, 2500},
      {43, 2570},
      {44, 2641},
      {45, 2786},
      {46, 2860},
      {47, 2935},
      {48, 3088},
      {49, 3166},
      {50, 3245},
      {51, 3406},
      {52, 3488},
      {53, 3571},
      {54, 3655},
      {55, 3826},
      {56, 3913},
      {57, 4001},
      {58, 4180},
      {59, 4271},
      {60, 4363},
      {61, 4550},
      {62, 4645},
      {63, 4741},
      {64, 4838},
      {65, 5035},
      {66, 5135},
      {67, 5236},
      {68, 5441},
      {69, 5545},
      {70, 5650},
      {71, 5863},
      {72, 5971},
      {73, 6080},
      {74, 6190},
      {75, 6413},
      {76, 6526},
      {77, 6640},
      {78, 6871},
      {79, 6988},
      {80, 7106},
      {81, 7345},
      {82, 7466},
      {83, 7588},
      {84, 7711},
      {85, 7960},
      {86, 8086},
      {87, 8213},
      {88, 8470},
      {89, 8600},
      {90, 8731},
      {91, 8996},
      {92, 9130},
      {93, 9265},
      {94, 9401},
      {95, 9676},
      {96, 9815},
      {97, 9955},
      {98, 10238},
      {99, 10381}
    ]
  end

  def magician_hp_max() do
    [
      {1, 221},
      {2, 238},
      {3, 256},
      {4, 275},
      {5, 295},
      {6, 316},
      {7, 338},
      {8, 361},
      {9, 385},
      {10, 410},
      {11, 436},
      {12, 463},
      {13, 491},
      {14, 520},
      {15, 550},
      {16, 581},
      {17, 613},
      {18, 646},
      {19, 680},
      {20, 715},
      {21, 751},
      {22, 788},
      {23, 826},
      {24, 865},
      {25, 905},
      {26, 946},
      {27, 988},
      {28, 1031},
      {29, 1075},
      {30, 1120},
      {31, 1166},
      {32, 1213},
      {33, 1261},
      {34, 1310},
      {35, 1360},
      {36, 1411},
      {37, 1463},
      {38, 1516},
      {39, 1570},
      {40, 1625},
      {41, 1681},
      {42, 1738},
      {43, 1796},
      {44, 1855},
      {45, 1915},
      {46, 1976},
      {47, 2038},
      {48, 2101},
      {49, 2165},
      {50, 2230},
      {51, 2296},
      {52, 2363},
      {53, 2431},
      {54, 2500},
      {55, 2570},
      {56, 2641},
      {57, 2713},
      {58, 2786},
      {59, 2860},
      {60, 2935},
      {61, 3011},
      {62, 3088},
      {63, 3166},
      {64, 3245},
      {65, 3325},
      {66, 3406},
      {67, 3488},
      {68, 3571},
      {69, 3655},
      {70, 3740},
      {71, 3826},
      {72, 3913},
      {73, 4001},
      {74, 4090},
      {75, 4180},
      {76, 4271},
      {77, 4363},
      {78, 4456},
      {79, 4550},
      {80, 4645},
      {81, 4741},
      {82, 4838},
      {83, 4936},
      {84, 5035},
      {85, 5135},
      {86, 5236},
      {87, 5338},
      {88, 5441},
      {89, 5545},
      {90, 5650},
      {91, 5756},
      {92, 5863},
      {93, 5971},
      {94, 6080},
      {95, 6190},
      {96, 6301},
      {97, 6413},
      {98, 6526},
      {99, 6640}
    ]
  end

  def martial_artist_hp_max() do
    [
      {1, 221},
      {2, 238},
      {3, 275},
      {4, 295},
      {5, 338},
      {6, 361},
      {7, 410},
      {8, 436},
      {9, 491},
      {10, 520},
      {11, 581},
      {12, 613},
      {13, 680},
      {14, 715},
      {15, 788},
      {16, 826},
      {17, 905},
      {18, 946},
      {19, 1031},
      {20, 1075},
      {21, 1166},
      {22, 1213},
      {23, 1310},
      {24, 1360},
      {25, 1463},
      {26, 1516},
      {27, 1625},
      {28, 1681},
      {29, 1796},
      {30, 1855},
      {31, 1976},
      {32, 2038},
      {33, 2165},
      {34, 2230},
      {35, 2363},
      {36, 2431},
      {37, 2570},
      {38, 2641},
      {39, 2786},
      {40, 2860},
      {41, 3011},
      {42, 3088},
      {43, 3245},
      {44, 3325},
      {45, 3488},
      {46, 3571},
      {47, 3740},
      {48, 3826},
      {49, 4001},
      {50, 4090},
      {51, 4271},
      {52, 4363},
      {53, 4550},
      {54, 4645},
      {55, 4838},
      {56, 4936},
      {57, 5135},
      {58, 5236},
      {59, 5441},
      {60, 5545},
      {61, 5756},
      {62, 5863},
      {63, 6080},
      {64, 6190},
      {65, 6413},
      {66, 6526},
      {67, 6755},
      {68, 6871},
      {69, 7106},
      {70, 7225},
      {71, 7466},
      {72, 7588},
      {73, 7835},
      {74, 7960},
      {75, 8213},
      {76, 8341},
      {77, 8600},
      {78, 8731},
      {79, 8996},
      {80, 9130},
      {81, 9401},
      {82, 9538},
      {83, 9815},
      {84, 9955},
      {85, 10238},
      {86, 10381},
      {87, 10670},
      {88, 10816},
      {89, 11111},
      {90, 11260},
      {91, 11561},
      {92, 11713},
      {93, 12020},
      {94, 12175},
      {95, 12488},
      {96, 12646},
      {97, 12965},
      {98, 13126},
      {99, 13451}
    ]
  end
end
