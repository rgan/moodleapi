require 'data_mapper'

class EnrolmentType
  include DataMapper::Resource

  storage_names[:default] = 'mdl_enrol'

  property :id, Serial
  # manual, guest, self
  property :enrol_type, String, :field => 'enrol', :required => true

  belongs_to :course, :child_key => 'courseid'

  has n, :enrolments, :child_key => 'enrolid'

end