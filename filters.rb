# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id, candidates)
    candidates.find {|candidate| candidate[:id] === id}
  end
  
def experienced?(candidate)
  candidate[:years_of_experience] >= 2
end

def qualified_candidates(candidates)
  qualified_candidates = candidates.select { 
    |candidate| experienced?(candidate) && 
    candidate[:github_points] >= 100 &&
    (candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python')) &&
    candidate[:date_applied] >= 15.days.ago.to_date &&
    candidate[:age] > 17
  }
end
  
# More methods will go below

def experienced_candidates(candidates)
  qualified_candidates = candidates.select { 
    |candidate| experienced?(candidate)
  }
end

def scored_candidates(candidates)
  qualified_candidates = candidates.select { 
    candidate[:github_points] >= 100
  }
end

def ruby_python_candidates(candidates)
  qualified_candidates = candidates.select { 
    (candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python'))
  }
end

def date_applied_candidates(candidates)
  qualified_candidates = candidates.select { 
    candidate[:date_applied] >= 15.days.ago.to_date
  }
end

def old_enough_candidates(candidates)
  qualified_candidates = candidates.select { 
    candidate[:age] > 17
  }
end

def ordered_by_qualifications(candidates)
  candidates.sort do |a, b| 
    experience_comparison = b[:years_of_experience] <=> a[:years_of_experience] 

    if experience_comparison == 0
      b[:github_points] <=> a[:github_points]
    else
      experience_comparison
    end
  end
end