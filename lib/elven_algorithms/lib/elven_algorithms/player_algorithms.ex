defmodule ElvenAlgorithms.PlayerAlgorithms do
  @moduledoc """
  TODO: Documentation
  """

  import ElvenAlgorithms

  @max_level 99

  ## HP Max Algorithm

  @hp_constant %{
    adventurer: 0,
    swordman: 8,
    archer: 3,
    magician: 0,
    martial_artist: 5
  }

  for level <- 1..@max_level, {class, multiplier} <- @hp_constant do
    hpx = level + floor((level - 1) * multiplier / 10)
    hp = trunc(0.5 * hpx ** 2 + 15.5 * hpx + 205)

    def hp_max(unquote(class), unquote(level)) do
      unquote(hp)
    end
  end

  ## MP Max Algorithm

  @mp_constant %{
    adventurer: 0,
    swordman: 0,
    archer: 1,
    magician: 8,
    martial_artist: 2
  }

  for level <- 1..@max_level, {class, multiplier} <- @mp_constant do
    mpx = level + floor((level - 1) * multiplier / 10)

    mp =
      floor(9.25 * mpx + 50.75) +
        trunc((mpx - 2) / 4) * 2 * (modulus(mpx - 2, 4) + 1 + trunc((mpx - 6) / 4) * 2)

    mp_trunc = trunc(mp)

    def mp_max(unquote(class), unquote(level)) do
      unquote(mp_trunc)
    end
  end

  ## Close Defense Algorithm

  @close_defense_constant %{
    adventurer:
      List.flatten([
        [5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12],
        [12, 13, 13, 14, 14, 15, 15, 16, 16, 17, 17, 18, 18],
        [19, 19, 20, 20, 21, 21, 22, 22, 23, 23, 24, 24],
        [25, 25, 26, 26, 27, 27, 28, 28, 29, 29, 30, 30, 31],
        [31, 32, 32, 33, 33, 34, 34, 35, 35, 36, 36, 37, 37],
        [38, 38, 39, 39, 40, 40, 41, 41, 42, 42, 43, 43, 44],
        [44, 45, 45, 46, 46, 47, 47, 48, 48, 49, 49, 50, 50],
        [51, 51, 52, 52, 53, 53, 54]
      ]),
    swordman:
      List.flatten([
        [5, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 14, 15, 16, 17],
        [18, 19, 20, 21, 22, 23, 23, 24, 25, 26, 27, 28, 29],
        [30, 31, 32, 32, 33, 34, 35, 36, 37, 38, 39, 40],
        [41, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 50, 51],
        [52, 53, 54, 55, 56, 57, 58, 59, 59, 60, 61, 62, 63],
        [64, 65, 66, 67, 68, 68, 69, 70, 71, 72, 73, 74, 75],
        [76, 77, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 86],
        [87, 88, 89, 90, 91, 92, 93]
      ]),
    archer:
      List.flatten([
        [5, 5, 6, 6, 7, 8, 8, 9, 10, 10, 11, 12, 12, 13, 14],
        [14, 15, 16, 16, 17, 18, 18, 19, 19, 20, 21, 21],
        [22, 23, 23, 24, 25, 25, 26, 27, 27, 28, 29, 29, 30],
        [31, 31, 32, 32, 33, 34, 34, 35, 36, 36, 37, 38, 38],
        [39, 40, 40, 41, 42, 42, 43, 44, 44, 45, 45, 46, 47],
        [47, 48, 49, 49, 50, 51, 51, 52, 53, 53, 54, 55, 55],
        [56, 57, 57, 58, 58, 59, 60, 60, 61, 62, 62, 63, 64],
        [64, 65, 66, 66, 67, 68, 68]
      ]),
    magician:
      List.flatten([
        [5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12],
        [12, 13, 13, 14, 14, 15, 15, 16, 16, 17, 17, 18, 18],
        [19, 19, 20, 20, 21, 21, 22, 22, 23, 23, 24, 24, 25],
        [25, 26, 26, 27, 27, 28, 28, 29, 29, 30, 30, 31, 31],
        [32, 32, 33, 33, 34, 34, 35, 35, 36, 36, 37, 37, 38],
        [38, 39, 39, 40, 40, 41, 41, 42, 42, 43, 43, 44, 44],
        [45, 45, 46, 46, 47, 47, 48, 48, 49, 49, 50, 50, 51],
        [51, 52, 52, 53, 53, 54]
      ]),
    martial_artist:
      List.flatten([
        [5, 5, 6, 7, 8, 8, 9, 10, 11, 11, 12, 13, 14, 14, 15],
        [16, 17, 17, 18, 19, 20, 20, 21, 22, 23, 23, 24, 25],
        [26, 26, 27, 28, 29, 29, 30, 31, 32, 32, 33, 34, 35],
        [35, 36, 37, 38, 38, 39, 40, 41, 41, 42, 43, 44, 44],
        [45, 46, 47, 47, 48, 49, 50, 50, 51, 52, 53, 53, 54],
        [55, 56, 56, 57, 58, 59, 59, 60, 61, 62, 62, 63, 64],
        [65, 65, 66, 67, 68, 68, 69, 70, 71, 71, 72, 73, 74],
        [74, 75, 76, 77, 77, 78]
      ])
  }

  for {class, constants} <- @close_defense_constant,
      {constant, level} <- Enum.with_index(constants, 1) do
    def close_defense(unquote(class), unquote(level)) do
      unquote(constant)
    end
  end
end
