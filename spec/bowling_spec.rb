require_relative '../lib/line.rb'
require_relative '../lib/frame.rb'

describe Line do
  let(:case1) { 'XXXXXXXXXXXX' }
  let(:case2) { '9-9-9-9-9-9-9-9-9-9-' }
  let(:case3) { '5/5/5/5/5/5/5/5/5/5/5' }
  let(:l) { Line.new }
  let(:f) { Frame.new }

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

  it 'Checks the add_frame method is working' do
    expect {l.add_frame(f)}.to change {l.line.count}.by(1)
  end

  it 'Checks the parse_line method is getting the right moves' do
    l.parse_line(case1)
    expect(l.line.count).to eql(12)
  end

  it 'Checks the parse_line method is getting the right moves' do
    l.parse_line(case2)
    expect(l.line.count).to eql(10)
  end

  it 'Checks the parse_line method is getting the right moves' do
    l.parse_line(case3)
    expect(l.line.count).to eql(11)
  end
end

describe Frame do
  let(:f) { Frame.new }

  it 'Checks the try_score method' do
    expect { f.try_score(10) }.to change { f.tries.count }.by(1)
  end

  it 'Checks the frame_score method' do
    f.try_score(7)
    f.try_score(2)
    expect(f.frame_score ).to eql(9)
  end
end