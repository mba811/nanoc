# encoding: utf-8

class Nanoc::Int::ContextTest < Nanoc::TestCase
  def test_context_with_instance_variable
    # Create context
    context = Nanoc::Int::Context.new({ foo: 'bar', baz: 'quux' })

    # Ensure correct evaluation
    assert_equal('bar', eval('@foo', context.get_binding))
  end

  def test_context_with_instance_method
    # Create context
    context = Nanoc::Int::Context.new({ foo: 'bar', baz: 'quux' })

    # Ensure correct evaluation
    assert_equal('bar', eval('foo', context.get_binding))
  end

  def test_example
    # Parse
    YARD.parse(LIB_DIR + '/nanoc/base/context.rb')

    # Run
    assert_examples_correct 'Nanoc::Int::Context#initialize'
  end
end
