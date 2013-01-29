require 'open-uri'

JSON.parse(open('http://cloud.github.com/downloads/june29/horesase-boys/meigens.json').read).each{|phrase|
  boy = Boy.where(number: phrase['cid']).first
  unless boy
    name,age = phrase['character'].scan(/([^(]+)(?:\((\d+)\))?/)[0]
    boy = Boy.new({
      name:   name,
      age:    age,
      number: phrase['cid'],
    })
    boy.save!
  end

  Phrase.create!({
    boy:    boy,
    title:  phrase['title'],
    line:   phrase['body'],
    image:  phrase['image'],
    number: phrase['eid'],
  },without_protection: true)
}
