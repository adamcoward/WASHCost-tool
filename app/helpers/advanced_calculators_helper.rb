module AdvancedCalculatorsHelper

  def options_for_water_system_exists
    [
      [ 'Installed', 0 ],
      [ 'Pre-existing', 1 ],
      [ 'Don\'t know', 2 ]
    ]
  end

  def options_for_area_type
    [
      [ 'Rural', 0 ],
      [ 'Small town', 1 ],
      [ 'Peri-urban', 2 ],
      [ 'Urban', 3 ],
      [ 'Don\'t know', 4 ]
    ]
  end

  def options_for_service_management
    [
      [ 'Utility management', 0 ],
      [ 'Household management', 1 ],
      [ 'Other (define)', 2 ],
      [ 'Don\'t know', 3 ]
    ]
  end

  def options_for_construction_financier
    [
      [ 'Utility management', 0 ],
      [ 'Household management', 1 ],
      [ 'Other (define)', 2 ],
      [ 'Don\'t know', 3 ]
    ]
  end

  def options_for_infrastructure_operator
    [
      [ 'External donor', 0 ],
      [ 'Community-based management', 1 ],
      [ 'Public sector (local)', 2 ],
      [ 'Public sector (national)', 3 ],
      [ 'Private sector', 4 ],
      [ 'Utility management', 5 ],
      [ 'Household management', 6 ],
      [ 'Other', 7 ],
      [ 'Don\'t know', 8 ]
    ]
  end

  def options_for_service_responsbility
    [
      [ 'External donor', 0 ],
      [ 'Community-based management', 1 ],
      [ 'Public sector (local)', 2 ],
      [ 'Public sector (national)', 3 ],
      [ 'Private sector', 4 ],
      [ 'Utility management', 5 ],
      [ 'Household management', 6 ],
      [ 'Other', 7 ],
      [ 'Don\'t know', 8 ]
    ]
  end

  def options_for_standard_enforcer
    [
      [ 'External donor', 0 ],
      [ 'Community-based management', 1 ],
      [ 'Public sector (local)', 2 ],
      [ 'Public sector (national)', 3 ],
      [ 'Private sector', 4 ],
      [ 'Utility management', 5 ],
      [ 'Household management', 6 ],
      [ 'Other', 7 ],
      [ 'Don\'t know', 8 ]
    ]
  end

  def options_for_rehabilitation_cost_owner
    [
      [ 'External donor', 0 ],
      [ 'Community-based management', 1 ],
      [ 'Public sector (local)', 2 ],
      [ 'Public sector (national)', 3 ],
      [ 'Private sector', 4 ],
      [ 'Utility management', 5 ],
      [ 'Household management', 6 ],
      [ 'Other', 7 ],
      [ 'Don\'t know', 8 ]
    ]
  end

  def options_for_supply_system_technologies
    [
      [ 'Borehole and handpump', 0 ],
      [ 'Mechanised borehole', 1 ],
      [ 'Mechanised piped system (< 5,000 people)', 3 ],
      [ 'Mechanised piped system (5000 - 1000 people)', 4 ],
      [ 'Mechanised piped system (1000 - 20000 people)', 5 ],
      [ 'Mechanised piped system (> 20000 people)', 6 ],
      [ 'Multi-town system (< 5000 people)', 7 ],
      [ 'Multi-town system (5000 - 10000 people)', 8 ],
      [ 'Multi-town system (10000 - 2000 people)', 9 ],
      [ 'Multi-town system (> 2000 people)', 10 ],
      [ 'Gravity fed system (< 5000 people)', 11 ],
      [ 'Gravity fed system (5000 - 10000 people)', 12 ],
      [ 'Gravity fed system (10000 - 20000 people)', 13 ],
      [ 'Gravity fed system (>20000 people)', 14 ],
      [ 'Small scale rain fed system', 15 ],
      [ 'Protected well', 16 ]
    ]
  end

  def options_for_water_source
    [
      [ 'Ground water', 0 ],
      [ 'Surface water', 1 ],
      [ 'Rain water', 2 ],
      [ 'Don\'t know', 3 ]
    ]
  end

  def options_for_surface_water_primary_source
    [
      [ 'Rainwater harvesting', 0 ],
      [ 'Catchment storage dam', 1 ],
      [ 'Sub-surface harvesting (sump)', 2 ],
      [ 'River', 3 ],
      [ 'Don\'t know', 4 ]
    ]
  end

  def options_for_water_treatment
    [
      [ 'No treatment', 0 ],
      [ 'Boiling', 1 ],
      [ 'Household filter', 2 ],
      [ 'Household cholorination', 3 ],
      [ 'Chlorination in piped system', 4 ],
      [ 'Water treatment works', 5 ],
      [ 'Not applicable', 6 ]
    ]
  end

  def options_for_power_supply
    [
      [ 'No power', 0 ],
      [ 'Mains electricity', 1 ],
      [ 'Windmills', 2 ],
      [ 'Solar power systems', 3 ],
      [ 'Generator', 4 ],
      [ 'Not applicable', 5 ]
    ]
  end

end
