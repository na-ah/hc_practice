# frozen_string_literal: true

members = %w[A B C D E F]

group1 = members.sample(rand(2..3)).sort
group2 = (members - group1).sort

p group1
p group2
