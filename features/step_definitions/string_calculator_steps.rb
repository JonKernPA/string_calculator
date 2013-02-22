When /^I add (.*), I should see (\d+)$/ do |numbers, sum|
  StringCalculator.add(numbers).should == sum.to_i
end

When /^I add (.*), I should see this error type (.*)$/ do |numbers, error|
  expect {StringCalculator.add(numbers)}.to raise_error(eval error)
end

Given /^an input with newlines$/ do
  @str = <<EOS
1
2
3,4
EOS
  
end

When /^I add the numbers$/ do
  @sum = StringCalculator.add(@str)
end

Then /^I should see the correct sum$/ do
  @sum.should == 10
end
