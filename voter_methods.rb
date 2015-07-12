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
      (C)reate, (L)ist, (U)pdate, (V)oter simulation, or (E)xit"
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
        group_select = gets.chomp.downcase
          case group_select
          when "c"
            list_candidate
            update_candidate_name
          when "v"
            list_voter
            update_voter_name
          end
      when "v"
        campaign = Campaign.new(@candidate_array, @voter_array)
        campaign.voter_choice
        campaign.tally_votes
        campaign.election_winner
      when "e"
        exit_game
      end
  end

  def create_candidate
    puts "What is your name"
    name = gets.chomp.capitalize
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
    name = gets.chomp.capitalize
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

  def update_candidate_name
    puts "Enter name exactly as shown"
    candidate_name = gets.chomp.capitalize
    @candidate_array.each do |c|
    if c.name == candidate_name
        puts "I found it, please enter new name"
        new_name = gets.chomp
        puts <<-END
        What is your new party affiliation:
        (D)emocrat or (R)epublican
        END
        party = gets.chomp.downcase
        case party
        when "d"
          c.party = "Democrat"
        when "r"
          c.party = "Republican"
        end
        c.name = new_name
        puts "You have updated the following candidate"
        spacer
        print c.name.capitalize + "-"
        puts c.party
      else
        puts "That candidate does not exist, press enter to be directed to main menu"
        main_menu_user_choice
    end
  end
  end

  def exit_game
    puts "Thank you for running our voting sim, goodbye"
    exit(0)
  end
  def update_voter_name
    puts "Enter name exactly as shown"
    voter_name = gets.chomp.capitalize
    @voter_array.each do |v|
    if v.name == voter_name
        puts "I found it, please enter new name"
        new_name = gets.chomp
        puts <<-END
         "Enter new Political view"
         Please select the letter that reflects your political views?
        (P)rogressive, (C)onservative, (L)ibertarian, (M)assachusetts Democrat, or (I)ndependent
        END
        new_politics = gets.chomp.downcase
        case new_politics
        when "p"
          v.politics =  "Progressive"
        when "c"
          v.politics = "Conservative"
        when "l"
          v.politics = "Libertarian"
        when "m"
          v.politics = "Massachusetts Democrat"
        when "i"
          v.politics = "Independent"
        end
        v.name = new_name
        puts "You have updated the following voter"
        spacer
        print v.name.capitalize + "-"
        puts v.politics
      else
        puts "That voter does not exist, you are being directed to main menu"
        main_menu_user_choice
    end
    end
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
