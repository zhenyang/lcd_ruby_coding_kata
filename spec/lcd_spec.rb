require "rspec"
require "Lcd"

describe Lcd do

  it "should print 1" do
    output = subject.print(1)
    output.should == "    \n  | \n    \n  | \n    \n"
  end

  it "should print 2" do
    output = subject.print(2)
    output.should == " -  \n  | \n -  \n|   \n -  \n"
  end

  it "should print 3" do
    output = subject.print(3)
    output.should == " -  \n  | \n -  \n  | \n -  \n"
  end

  it "should print 45" do
    output = subject.print(45)
    output.should == "     -  \n| | |   \n -   -  \n  |   | \n     -  \n"
  end

  it "should print 6 in size 2" do
    output = subject.print(6,2)
    output.should == " --  \n|    \n|    \n --  \n|  | \n|  | \n --  \n"
  end

  it "should print 7890 in size 3" do
    output = subject.print(7890,3)
    output.should == " ---   ---   ---   ---  \n"+
                     "    | |   | |   | |   | \n"+
                     "    | |   | |   | |   | \n"+
                     "    | |   | |   | |   | \n"+
                     "       ---   ---        \n"+
                     "    | |   |     | |   | \n"+
                     "    | |   |     | |   | \n"+
                     "    | |   |     | |   | \n"+
                     "       ---   ---   ---  \n"
  end

end