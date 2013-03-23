require 'test_helper'

describe TOTES::Runner do
  parent_1 = self

  context 'context 1' do
    parent_2 = self

    context 'context 2' do
      parent_3 = self

      context 'context 3' do
        it "must create correct parents list" do
          @subject.stack(self).must == [
            parent_1, parent_2, parent_3, self
          ]
        end
      end
    end
  end
end
