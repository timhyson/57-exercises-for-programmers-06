require 'retirement'

describe Retirement do
  before do
    allow(subject).to receive(:puts).and_return nil
  end

  it 'asks user for their age' do
    allow(subject).to receive(:gets).and_return(25)
    expect(subject.prompt_age).to eq 25
  end

  it 'asks user for their desired retirement age' do
    retirement = Retirement.new
    allow(retirement).to receive(:gets).and_return(65)
    expect(retirement.prompt_retirement).to eq 65
  end

  it 'calculates in which year user can retire' do
    retirement = Retirement.new
    expect(retirement.retirement_year(65, 25)).to eq(Time.now.year + 40)
  end

  it 'displays remaining years until retirement' do
    retirement = Retirement.new
    allow(retirement).to receive(:gets).and_return(25, 65)
    expect(retirement.run).to eq("You have 40 years left until you can retire.\nIt's #{Time.now.year}, so you can retire in #{Time.now.year + 40}.")
  end
end
