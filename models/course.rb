require 'data_mapper'

class Course
  include DataMapper::Resource

  storage_names[:default] = 'mdl_course'

  property :id, Serial, :field => 'id'
  property :fullname, String, :required => true, :length => 1..254
  property :shortname, String, :required => true, :length => 1..255
  property :summary, Text

  has n, :enrolment_types, :child_key => 'courseid'

  def enrolments
    enrolment_types.collect { |enrolment_type| enrolment_type.enrolments }.flatten
  end

  def enrolled_users
    enrolment_types.collect { |enrolment_type| enrolment_type.users }.flatten
  end

  def add_enrolment(enrolment)
    manual_enrolment_type.enrolments << enrolment
    raise "Could not save" unless save
  end

  def url
    "/courses/#{self.id}"
  end

  def self.parse_json(json)
    json = JSON.parse(json)
    Course.new(:fullname => json['fullname'], :shortname => json['shortname'], :summary => json['summary'])
  end

  private

  def manual_enrolment_type
    manual_enrolment_type = enrolment_types.select { | enrolment_type| enrolment_type.enrol_type == 'manual'}.first
    if manual_enrolment_type.nil?
      manual_enrolment_type = EnrolmentType.create(:enrol_type => "manual", :course => self)
      enrolment_types << manual_enrolment_type
    end
    manual_enrolment_type
  end
end
