class StringCalculator
  def add(input_string=0)
    input_string.to_i
  end
end

describe StringCalculator do
  let(:string_calculator) { StringCalculator.new }

  it "returns 0 for nil" do
    string_calculator.add().should eq 0
  end

  it "returns 0 for empty string" do
    string_calculator.add('').should eq 0
  end

  it "returns the single number provided" do
    string_calculator.add('1').should eq 1
  end
end
