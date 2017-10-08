class Employee
  attr_accessor :id, :first_name, :last_name, :email, :birthday

  def initialize(options_hash)
    @id = options_hash['id']
    @first_name = options_hash['first_name']
    @last_name = options_hash['last_name']
    @email = options_hash['email']
    @birthday = options_hash['birthday'] ? Date.parse(options_hash['birthday']) : "N/A"
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def self.find(employee_id)
    Employee.new(Unirest.get("localhost:3000/api/v2/employees/#{ employee_id }.json").body)
  end

  def self.all
    employee_collection = []
    response = Unirest.get("localhost:3000/api/v2/employees.json").body
    response.each do |employee_hash|
      employee_collection << Employee.new(employee_hash)
    end
    employee_collection
  end

end