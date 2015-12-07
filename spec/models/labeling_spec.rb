require 'rails_helper'
 
 RSpec.describe Labeling, type: :model do
 # #6
   it { should belong_to :labelable }
 end