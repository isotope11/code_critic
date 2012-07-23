require 'test_helper'

describe DiffFile do
  before do
    @str = <<-EOL
--- /dev/null
+++ b/app/assets/stylesheets/_commits.css.scss
@@ -1 +1,69 @@
+.commits{
+  margin: 0 auto;
+}
    EOL
    git_diff = mock()
    git_diff.expects(:diff).returns(@str)
    @diff_file = DiffFile.new(git_diff, 'asdf', 0)
  end

  it "serves each line up as a DiffLine for #each_line" do
    @diff_file.each_line do |l|
      l.must_be_instance_of(DiffLine)
    end
  end

  it "knows its file_index" do
    @diff_file.file_index.must_equal 0
  end

  it "knows its commit" do
    @diff_file.commit.must_equal 'asdf'
  end

  it "knows its file path" do
    @diff_file.file_path.must_equal "/app/assets/stylesheets/_commits.css.scss"
  end
end
