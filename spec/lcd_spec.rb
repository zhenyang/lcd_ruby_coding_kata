require "rspec"
require "Lcd"

describe Lcd do

  it "should print 1" do
    output = subject.display(1)
    output.should == "    \n  | \n    \n  | \n    \n"
  end

  it "should print 2" do
    output = subject.display(2)
    output.should == " -  \n  | \n -  \n|   \n -  \n"
  end

  it "should print 3" do
    output = subject.display(3)
    output.should == " -  \n  | \n -  \n  | \n -  \n"
  end

  it "should print 45" do
    output = subject.display(45)
    output.should == "     -  \n| | |   \n -   -  \n  |   | \n     -  \n"
  end

  it "should print 6 in size 2" do
    output = subject.display(6,2)
    output.should == " --  \n|    \n|    \n --  \n|  | \n|  | \n --  \n"
  end

  it "should print 7890 in size 3" do
    output = subject.display(7890,3)
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

  it "should print 1 in size 1 and rotate 90 degrees" do
    output = subject.display(1,1,1)
    output.should == "     \n"+
                     "     \n"+
                     " - - \n"+
                     "     \n"
  end

  it "should print 1 in size 1 and rotate 180 degrees" do
    output = subject.display(1,1,2)
    output.should == "    \n |  \n    \n |  \n    \n"
  end

  it "should print 1 in size 2 and rotate 270 degrees" do
    output = subject.display(1,2,3)
    output.should == "       \n -- -- \n       \n       \n       \n"
  end

  it "should print 4567 in size 4 and rotate 270 degrees" do
    output = subject.display(4567,4,3)
    output.should == "           \n ---- ---- \n|          \n|          \n|          \n|          \n           \n           \n      ---- \n|    |    |\n|    |    |\n|    |    |\n|    |    |\n ---- ---- \n           \n      ---- \n|    |    |\n|    |    |\n|    |    |\n|    |    |\n ----      \n           \n ---- ---- \n     |     \n     |     \n     |     \n     |     \n ----      \n"
  end

end