require "test_helper"

require "#{RAILS_ROOT}/plugins/mezuro/test/fixtures/module_result_fixtures"

class ModuleResultTest < ActiveSupport::TestCase

  def setup
    @hash = ModuleResultFixtures.module_result_hash
    @module_result = ModuleResultFixtures.module_result
  end
  should 'create module result' do
    assert_equal @hash[:id] , Kalibro::ModuleResult.new(@hash).id
  end
  
  should 'convert module result to hash' do
    assert_equal @hash, @module_result.to_hash
  end

  should 'find module result' do
    response = {:module_result => @hash}
    Kalibro::ModuleResult.expects(:request).with('ModuleResult',:get_module_result, {:module_result_id => @module_result.id}).returns(response)
    assert_equal @module_result.grade, Kalibro::ModuleResult.find(@module_result.id).grade
  end
  
  should 'return children of a module result' do
    response = {:module_result => [@hash]}
    Kalibro::ModuleResult.expects(:request).with('ModuleResult',:children_of, {:module_result_id => @module_result.id}).returns(response)
    assert @hash[:id], @module_result.children.first.id
  end

end
