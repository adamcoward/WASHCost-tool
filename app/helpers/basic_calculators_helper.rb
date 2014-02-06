module BasicCalculatorsHelper

  # constants

  def minimum_capital_expenditure_for_water
    0
  end

  def maximum_capital_expenditure_for_water
    300
  end

  def minimum_guidance_capital_expenditure_for_water
    20
  end

  def maximum_guidance_capital_expenditure_for_water
    61
  end

  def minimum_recurrent_expenditure_for_water
    0
  end

  def maximum_recurrent_expenditure_for_water
    30
  end

  def minimum_guidance_recurrent_expenditure_for_water
    3
  end

  def maximum_guidance_recurrent_expenditure_for_water
    6
  end

  # options

  def options_for_water_supply_technologies
    [
      [ 'borehole_handpump', 0 ],
      [ 'mechanised_borehole', 1 ],
      [ 'single_town_scheme', 2 ],
      [ 'multi_town_scheme', 3 ],
      [ 'mixed_pipe_supply', 4 ]
    ]
  end

end