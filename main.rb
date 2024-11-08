# This is the main entrypoint into the program
# It requires the other files/gems that it needs
require 'pp'
require './candidates'
require './filters'

## Your test code can go here

# pp find(11, @candidates)
# pp experienced?(@candidates[1])

filtered_candindates = qualified_candidates(@candidates)

pp ordered_by_qualifications(filtered_candindates)

# pp @candidates