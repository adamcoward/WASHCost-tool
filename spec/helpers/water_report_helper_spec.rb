require_relative  '../spec_helper'

describe WaterReportHelper, :type => :helper do
  subject { Class.new.include WaterReportHelper }

  describe "#get_total" do
    it "should return a valid total" do
       capital, recurrent, population = 61, 3, 2000
       expect(get_total(capital, recurrent, population)).to eq(182000)
    end
  end

  describe "#get_capex_benchmark_rating" do
    context "when below benchmarks" do
      it "should be 0.5" do
        waterSourceIndex, expense = 0, 19
        expect(get_capex_benchmark_rating(waterSourceIndex, expense)).to eq(0.5)
      end
    end

    context "when within benchmarks" do
      it "should be 2" do
        waterSourceIndex, expense = 0, 21
        expect(get_capex_benchmark_rating(waterSourceIndex, expense)).to eq(2)
      end
    end

    context "when above benchmarks" do
      it "should be 1" do
        waterSourceIndex, expense = 0, 62
        expect(get_capex_benchmark_rating(waterSourceIndex, expense)).to eq(1)
      end
    end
  end

  describe "#get_recex_benchmark_rating" do
    context "when below benchmarks" do
      it "should be 0.5" do
        waterSourceIndex, expense = 0, 2
        expect(get_recex_benchmark_rating(waterSourceIndex, expense)).to eq(0.5)
      end
    end

    context "when within benchmarks" do
      it "should be 2" do
        waterSourceIndex, expense = 0, 5
        expect(get_recex_benchmark_rating(waterSourceIndex, expense)).to eq(2)
      end
    end

    context "when above benchmarks" do
      it "should be 1" do
        waterSourceIndex, expense = 0, 7
        expect(get_recex_benchmark_rating(waterSourceIndex, expense)).to eq(1)
      end
    end
  end

  describe "#normalise_best_level_to_be_3" do
    context "when is 3" do
      it "should be 0" do
        expect(normalise_best_level_to_be_3(3)).to eq(0)
      end
    end

    context "when is 2" do
      it "should be 1" do
        expect(normalise_best_level_to_be_3(2)).to eq(1)
      end
    end

    context "when is 1" do
      it "should be 2" do
        expect(normalise_best_level_to_be_3(1)).to eq(2)
      end
    end

    context "when is 0" do
      it "should be 3" do
        expect(normalise_best_level_to_be_3(0)).to eq(3)
      end
    end
  end

  describe "#rating_for_service_level" do
    context "when is high" do
      it "should be 1.5" do
        expect(rating_for_service_level(3)).to eq(1.5)
      end
    end

    context "when is basic" do
      it "should be 1" do
        expect(rating_for_service_level(2)).to eq(1)
      end
    end

    context "when is sub-standard" do
      it "should be 0.25" do
        expect(rating_for_service_level(1)).to eq(0.25)
      end
    end

    context "when there no service" do
      it "should be 0" do
        expect(rating_for_service_level(0)).to eq(0)
      end
    end
  end

  describe "#compute_score" do
    context "when water = 0, capital ex = 18, recurring ex = 4, \
              accessibility = 0, quality = 3, quantity = 3, reliability = 0" do
      it "should be 3"  do
        water = 0
        capital, recurring = 20, 4
        accessibility, quality, quantity, reliability = 0, 3, 3, 0
        expect(compute_score(water, capital, recurring, accessibility,
               quality, quantity, reliability)).to eq(10)
      end
    end

      context "when water = 0, capital = 79, recurring = 2 \
               accessibility = 2, quality = 2, quantity = 3, reliability = 3" do
      it "should be 1"  do
          water = 0
          capital, recurring = 79, 2
          accessibility, quality, quantity, reliability = 2, 2, 3, 2
          expect(compute_score(water, capital, recurring, accessibility,
                 quantity, quality,reliability)).to eq(4.5)
        end
      end
  end

  describe "#get_rating" do
    context "when using: Borehole & handpump, capital ex = 18, recurring ex = 4, \
              accessibility = 0, quality = 3, quantity = 3, reliability = 0" do
      it "should be 3"  do
        water = 0
        capital, recurring = 20, 4
        accessibility, quality, quantity, reliability = 0, 3, 3, 0
        expect(get_rating(water, capital, recurring, accessibility,
               quality, quantity, reliability)).to eq(3)
      end
    end

    context "when using: water = 0, capital = 79, recurring = 2 \
               accessibility = 2, quality = 2, quantity = 3, reliability = 3" do
      it "should be 1"  do
          water = 0
          capital, recurring = 79, 2
          accessibility, quality, quantity, reliability = 2, 2, 3, 2
          expect(get_rating(water, capital, recurring, accessibility,
                quantity, quality, reliability)).to eq(1)
      end
    end

    context "when an argument is nil" do
      it "should be nil" do
        expect(get_rating(0, 1, 1, 0, nil, 3, 0)).to be_nil
      end
    end
  end

  describe "#get_service_rating_label" do
    context "when has one star" do
      it "should read No service" do
        expect(get_service_rating_label(0)).to eq(t 'report.sustainability.water.one_star')
      end
    end
    context "when has two stars" do
      it "should read Sub-standard service" do
        expect(get_service_rating_label(1)).to eq(t 'report.sustainability.water.two_stars')
      end
    end
    context "when has three stars" do
      it "should read Basic service" do
        expect(get_service_rating_label(2)).to eq(t 'report.sustainability.water.three_stars')
      end
    end
    context "when has four stars" do
      it "should read High standard service" do
        expect(get_service_rating_label(3)).to eq(t 'report.sustainability.water.four_stars')
      end
    end
  end

  describe "#is_ready_form" do
    let (:complete_form) {
        { :water => 0,:capital => 1, :recurrent => 2, :time => 3,
          :quality  => 4, :quantity => 5,:reliability => 6 }
      }
    let (:incomplete_form) {
        { :water => 0, :capital => nil, :recurrent => 2, :time => 3,
          :quality  => 4, :quantity => 5,:reliability => 6 }
      }
    context "when the form is complete" do
      it "should be true" do
        expect(is_form_ready?(complete_form)).to be_true
      end
    end
    context "when the form is incomplete" do
      it "should be false" do
        expect(is_form_ready?(incomplete_form)).to be_false
      end
    end
  end
end
