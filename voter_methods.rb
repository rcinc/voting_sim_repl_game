require './voter'
require './candidate'
require './voting_simulation'

class VoterSim
  attr_accessor :candidate_array, :voter_array

  def initialize
    @candidate_array = []
    @voter_array = []
  end

  def invalid_choice
        puts "invalid Choice"
  end

  def intro
      puts "What would you like to do?"
  end

  def display_choices
      puts <<-END
      "Please select from the following choices:
      (C)reate, (L)ist, (U)pdate, or start (V)oter simulation."
      END
  end

  def main_menu_user_choice
      user_choice = gets.chomp.downcase
      case user_choice
      when "c"
        puts <<-END"What would you like to create"
        Select
        (C) Candidate
        (V) Voter
        END
        character_choice = gets.chomp.downcase
          case character_choice
          when "c"
            create_candidate
          when "v"
            create_voter
          end

      when "l"
        puts <<-END
        What list what you like to view
        (C)andidate list or (V)oter list
        END
        user_list = gets.chomp.downcase
        case user_list
        when "c"
          spacer
          list_candidate
        when "v"
          spacer
          list_voter
        end
      when "u"
        puts <<-END
        "Which kind of character would you like to update"
        (C)andidate or (V)oter
        END

      when "v"
        campaign = Campaign.new(@candidate_array, @voter_array)
        campaign.voter_choice
        campaign.tally_votes
        campaign.election_winner
      end
  end

  def create_candidate
    puts "What is your name"
    name = gets.chomp
    puts <<-END
    What is your party affiliation:
    (D)emocrat or (R)epublican
    END
    party = gets.chomp.downcase
    case party
    when "d"
      name = Candidate.new(name,"Democrat")
    when "r"
      name = Candidate.new(name, "Republican")
    end
      @candidate_array << name
  end

  def create_voter
    puts "what is your name?"
    name = gets.chomp
    puts <<-END
    Which party do you associate your politics with?
    (P)rogressive, (C)onservative, (L)ibertarian, (M)assachusetts Democrat, or (I)ndependent
    END
    politics = gets.chomp.downcase
    case politics
    when "p"
      name = Voter.new(name, "Progressive")
      # @voter_array.push name
    when "c"
      name = Voter.new(name, "Conservative")
      # @voter_array.push name
    when "l"
      name = Voter.new(name, "Libertarian")
    when "m"
      name = Voter.new(name, "Massachusetts Democrat")
      # @voter_array.push name
    when "i"
      name = Voter.new(name, "Independent")
      # @voter_array.push name
    end
      @voter_array.push name
  end

  def list_voter
    @voter_array.each { |x|
    print x.name.capitalize + "-"
    puts x.politics}
    spacer
  end

  def list_candidate
    @candidate_array.each { |x|
    print x.name.capitalize + "-"
    puts x.party}
    spacer
  end

  def spacer
    puts " "
  end
  def start
  while true
    # start = VoterSim.new
    intro
    display_choices
    main_menu_user_choice
    spacer
  end
  end
end
