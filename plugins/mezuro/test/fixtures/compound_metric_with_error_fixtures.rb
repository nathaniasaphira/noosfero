require File.dirname(__FILE__) + '/error_fixtures'

class CompoundMetricWithErrorFixtures
    
  def self.create
    fixture = Kalibro::Entities::CompoundMetricWithError.new
    fixture.metric = CompoundMetricFixtures.compound_metric
    fixture.error = ErrorFixtures.create
    fixture
  end

  def self.create_hash
    {:metric => CompoundMetricFixtures.compound_metric_hash, :error => ErrorFixtures.create_hash,
      :attributes! => {:metric => {
          'xmlns:xsi'=> 'http://www.w3.org/2001/XMLSchema-instance',
          'xsi:type' => 'kalibro:compoundMetricXml'  }}}
  end

end
