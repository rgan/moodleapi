class Enrolment
  include DataMapper::Resource

  storage_names[:default] = 'mdl_user_enrolments'

  property :id, Serial
  property :status, Integer
  property :timestart, Integer
  property :timeend, Integer

  belongs_to :enrolment_type, :child_key => 'enrolid'
  belongs_to :user, :child_key => 'userid'

  def self.parse_json(json)
    json = JSON.parse(json)
    Enrolment.new(:userid => json['userid'], :status => json['status'], :timestart => json['timestart'], :timeend => json['timeend'])
  end

  def url
    "/courses/#{enrolment_type.course.id}/enrolments/#{self.id}"
  end

end