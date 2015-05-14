require 'byebug'

class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
    add_to_roster unless boss.nil?
  end

  def bonus(multiplier)
    bonus = @salary * multiplier
  end

  def add_to_roster
    @boss.add_employee(self)
  end

end

class Manager < Employee
  attr_accessor :employees

  def initialize(name, title, salary, boss)
    super
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
  end

  # def add_to_roster
  #   @boss.add_employee(self)
  # end

  def get_employee_salaries
    sum = 0

    @employees.each do |employee|
      if employee.class == Manager
        sum += employee.salary + employee.get_employee_salaries
      else
        sum += employee.salary
      end
    end

    sum

  end

  def bonus(multiplier)
    get_employee_salaries * multiplier
  end

end


ned = Manager.new("Ned", "Founder", 1000000, 	nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000,	darren)
david = Employee.new("David",	"TA", 10000, darren)
