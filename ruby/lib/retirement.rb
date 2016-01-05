class Retirement
  def prompt_age
    puts "What is your current age?"
    current_age = gets.to_s.chomp
    @current_age = current_age.to_i
  end

  def prompt_retirement
    puts "At what age would you like to retire?"
    retirement_age = gets.to_s.chomp
    @retirement_age = retirement_age.to_i
  end

  def retirement_year(retirement_age, current_age)
    @working_life = retirement_age - current_age
    @retirement_year = @working_life + Time.now.year
  end

  def output_message
    "You have #{@working_life.to_s} years left until you can retire.\nIt's #{Time.now.strftime('%Y')}, so you can retire in #{@retirement_year.to_s}."
  end

  def run
    prompt_age
    prompt_retirement
    retirement_year(@retirement_age, @current_age)
    output_message
  end

  private

  def working_life(retirement_age, current_age)
    @working_life = (retirement_age - current_age)
  end
end
