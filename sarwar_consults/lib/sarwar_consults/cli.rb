# CLI Controller >> user interaction and dealing with input
require 'pry'
class SarwarConsults::CLI

  def call
    introduction
    services
  end

  def introduction
    puts "Welcome to Sarwar Consults!"
    puts "Look at the following services:"
    #list_services
    puts "
1. Full Service Small Business Marketing
2. Search Engine Optimization (SEO)
3. Search Engine Marketing (SEM)
4. Website Development &amp; Management
5. Social Media Marketing (SMM)6. Social Media Management
7. Brand Strategy
8. Campaign Strategy
9. Email Marketing
10. Creative Design
11. Market Research and Planning
12. Mobile Website and Application Development
13. Content Management"
    
    puts "To exit at anytime, type exit."
    puts "To sign up at anytime, type sign up."
    puts "What type of services are you looking for today:"
  end

  def list_services
    list = SarwarConsults::Service.scrape_services
    list.each.with_index(1){|li,i| puts "#{i}. #{li}"}
  end

  def services
    input = ""
    while input != "exit"
      input = gets.strip
      services = SarwarConsults::Service.scrape_services
      urls = SarwarConsults::Service.scrape_url
      case input
      when input.to_i <= 13
          service = services[input.to_i-1].strip
          url = urls[input.to_i-1].strip

          puts service
          puts SarwarConsults::Service.scrape_content(url)
          puts "For more information, click on: #{url}"

      when "sign up"
          puts "Click on the link below to sign up!"
          puts SarwarConsults::Service.scrape_signup
      when "exit"
          puts "Until next time!"
      break
      else
          puts "I'm sorry, I didn't get that. Can you type that again?"
      end
    end
  end


end
