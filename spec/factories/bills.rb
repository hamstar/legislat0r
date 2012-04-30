FactoryGirl.define do
  factory :bill do
    sequence :name do |n|
      "Bill ##{n}"
    end

    markdown "Lorem ipsum dolor sit amet, consectetur adipiscing elit? Morbi laoreet est vitae nibh lacinia porttitor. Aliquam in purus et mauris pellentesque faucibus. Duis rutrum posuere nulla, sit amet laoreet mauris iaculis laoreet. Vivamus aliquam lectus sed dolor vestibulum pretium? Morbi posuere 2.0 mattis commodo. Curabitur cursus eros vel odio interdum a pretium enim consequat. Quisque lectus mauris, rutrum laoreet luctus mattis, luctus et lacus. Phasellus ut arcu sapien."
  end
end
