require 'retirement'

describe Retirement do
  describe '#prompt_age' do
    it 'asks user for their age' do
      allow(subject).to receive(:gets).and_return(25)
      expect(subject.prompt_age).to eq 25
    end
  end

  describe '#prompt_retirement' do
    it 'asks user for their desired retirement age' do
      retirement = Retirement.new
      allow(retirement).to receive(:gets).and_return(65)
      expect(retirement.prompt_retirement).to eq 65
    end
  end

  describe '#retirement year' do
    it 'calculates in which year user can retire' do
      retirement = Retirement.new
      allow(Time.now).to receive(:strftime).and_return(2015)
      expect(retirement.retirement_year(65, 25)).to eq 2055
    end
  end

  describe '#run' do
    it 'displays remaining years until retirement' do
      retirement = Retirement.new
      allow(Time.now).to receive(:strftime).and_return(2015)
      allow(retirement).to receive(:gets).and_return(25, 65)
      expect(retirement.run).to eq("You have 40 years left until you can retire.\nIt's 2015, so you can retire in 2055.")
    end
  end

#  describe '#working_life' do
#      it 'calculates remaining years of work' do
#      retirement = Retirement.new
#      allow(retirement).to receive(:gets).and_return(65, 25)
#      expect(retirement.working_life(retirement.prompt_retirement, retirement.prompt_age)).to eq 40
#    end
#  end
end
