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

  def url
    "/courses/#{self.id}"
  end

  def self.parse_json(json)
    json = JSON.parse(json)
    Course.new(:fullname => json['fullname'], :shortname => json['shortname'], :summary => json['summary'])
  end
end
