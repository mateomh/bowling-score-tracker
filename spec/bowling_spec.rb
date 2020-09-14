require_relative '../lib/line.rb'
require_relative '../lib/frame.rb'

describe Line do
  let(:case1) { 'XXXXXXXXXXXX' }
  let(:case2) { '9-9-9-9-9-9-9-9-9-9-' }
  let(:case3) { '5/5/5/5/5/5/5/5/5/5/5' }
  let(:l) { Line.new }

  it 'Checks for the all strikes score' do
    l.parse_line(case1)
    expect(l.check_line_score).to eql(300)
  end

  it 'Checks for a regular score' do
    l.parse_line(case2)
    expect(l.check_line_score).to eql(90)
  end

  it 'Checks for all spares score' do
    l.parse_line(case3)
    expect(l.check_line_score).to eql(150)
  end
end