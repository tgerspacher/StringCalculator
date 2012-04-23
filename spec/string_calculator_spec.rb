module StringCalculator
  def self.add(input_string='')
    # input_string.to_i

    # string_array = input_string.split(',')

    # puts "different delimiter!!!(#{input_string})" if input_string.start_with? '//'
    string_array = input_string
    string_array.gsub! string_array[2], ',' if string_array.start_with? '//'
    string_array.gsub! '\n', ','
    string_array = string_array.split(',')

    # return 0 if string_array.length == 0

    # string_array.map! { |v| v.to_i }
    # result = string_array.inject { |sum, v| sum + v }
    result = 0
    string_array.each do |argument|
      argument = argument.to_i
      raise NegativesNotAllowed if argument < 0
      result += argument
    end

    return result
  end
end

describe StringCalculator do
  let(:string_calculator) { StringCalculator }

  it "returns 0 for nil" do
    string_calculator.add().should eq 0
  end

  it "returns 0 for empty string" do
    string_calculator.add('').should eq 0
  end

  it "returns the single number provided" do
    string_calculator.add('1').should eq 1
  end

  it "returns the sum of two numbers provided" do
    string_calculator.add("1,2").should eq 3
  end

  it "returns the sum of multiple numbers provided" do
    string_calculator.add('1,2,3,4').should eq 10
  end

  it "sums up strings with \n as text delimiters" do
    # string_calculator.add('1\n3').should eq 4

    string_calculator.add('1\n2,3').should eq 6

    # TODO:
    # string_calculator.add('1,\n').should_not eq 1
  end

  it "sums up strings with different delimiters" do
    # //[delimiter]\n[numbers...]
    string_calculator.add('//#\n1#2').should eq 3
  end

  it "throws an exception 'negatives not allowed' and the negative that was passed" do
    # expect { string_calculator.add('-4') }.should raise_error

    # string_calculator.add('-4').should_raise Exception
    string_calculator.add('-4').should raise_exception(NegativesNotAllowed)

    # TODO: how show negative in message
    # TODO: how check error message
  end


end
