require "formula"

class GrGsm < Formula
  homepage "https://github.com/ptrkrysik/gr-gsm"
  head "https://github.com/ptrkrysik/gr-gsm.git"

  patch :DATA

  depends_on "cmake" => :build
  depends_on "swig" => :build
  depends_on "boost"
  depends_on "gnuradio"

  def install
    mkdir "build" do
      system "cmake", '..', *std_cmake_args << "-DPYTHON_LIBRARY=#{python_path}/Frameworks/Python.framework/"
      system "make install"
    end
  end
  
  def python_path
    python = Formula.factory('python')
    kegs = python.rack.children.reject { |p| p.basename.to_s == '.DS_Store' }
    kegs.find { |p| Keg.new(p).linked? } || kegs.last
  end  
end
