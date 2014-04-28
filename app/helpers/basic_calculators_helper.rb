module BasicCalculatorsHelper

  # formatters

  def format_info_text( locale_key )
    str = t( locale_key ).gsub(/http:\/\/[^\s<]+/, '<a href="\0" target="_blank">\0</a>')
    simple_format( str )
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

  def options_for_water_access
    [
      [ 'less_than_ten', 0 ],
      [ 'between_ten_and_thirty', 1 ],
      [ 'between_thirty_and_sixty', 2 ],
      [ 'more_thank_sixty', 3 ]
    ]
  end

  def options_for_water_quantities
    [
      [ 'less_than_five_litres', 0 ],
      [ 'between_five_and_nineteen_litres', 1 ],
      [ 'between_twenty_and_sixty_litres', 2 ],
      [ 'more_than_sixy_litres', 3 ]
    ]
  end

  def options_for_water_qualities
    [
      [ 'regular_and_meets_standards', 0 ],
      [ 'occasional_and_meets_standards', 1 ],
      [ 'one_off_after_construction', 2 ],
      [ 'no_testing', 3 ]
    ]
  end

  def options_for_water_reliability
    [
      [ 'works_all_the_time', 0 ],
      [ 'not_working_less_than_twelve_days_a_year', 1 ],
      [ 'not_working_more_than_twelve_days_a_year', 2 ],
      [ 'not_working_all_of_the_time', 3 ]
    ]
  end

  def options_for_latrine_technologies
    [
      [ 'traditional_pit_latrine', 0 ],
      [ 'slab_latrine', 1 ],
      [ 'vip_latrine', 2 ],
      [ 'pour_flush_latrine', 3 ],
      [ 'twin_pit_pour_flush_latrine', 4 ],
      [ 'latrine_with_septic_tank', 5 ]
    ]
  end

  def options_for_household_latrines
    [
      [ 'household_latrine_available', 0 ],
      [ 'household_latrine_unavailable', 1 ]
    ]
  end

  def options_for_latrine_impermeability
    [
      [ 'impermeable_slab', 0 ],
      [ 'no_impermeable_slab', 1 ]
    ]
  end

  def options_for_latrine_environmental_impact
    [
      [ 'non_problematic_safe_disposal_reuse_biproducts', 0 ],
      [ 'non_problematic_safe_disposal', 1 ],
      [ 'significant_pollution', 2 ]
    ]
  end

  def options_for_latrine_usage
    [
      [ 'latrine_usage_all', 0 ],
      [ 'latrine_usage_some', 1 ],
      [ 'latrine_usage_none', 2 ]
    ]
  end

  def options_for_latrine_reliability
    [
      [ 'latrine_reliable', 0 ],
      [ 'latrine_inconsistent', 1 ],
      [ 'latrine_unreliable', 2 ]
    ]
  end

end