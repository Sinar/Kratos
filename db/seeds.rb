# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'json'

# AAA
# If you do not want this, get rid of it and do it through the console.
# See: http://stackoverflow.com/questions/2708417/creating-an-admin-user-in-devise-on-rails-beta-3
Admin.create({
  email: 'sinar-project@googlegroups.com',
  password: 'What is rational is actual, what is actual is rational.'
})

# Geo

## See: http://en.wikipedia.org/wiki/ISO_3166-2:MY
regions = Region.create([
  { code: '01', name: 'Johor' },
  { code: '02', name: 'Kedah' },
  { code: '03', name: 'Kelantan' },
  { code: '04', name: 'Melaka' },
  { code: '05', name: 'Negeri Sembilan' },
  { code: '06', name: 'Pahang' },
  { code: '07', name: 'Pulau Pinang' },
  { code: '08', name: 'Perak' },
  { code: '09', name: 'Perlis' },
  { code: '10', name: 'Selangor' },
  { code: '11', name: 'Terengganu' },
  { code: '12', name: 'Sabah' },
  { code: '13', name: 'Sarawak' },
  { code: '14', name: 'Wilayah Persekutuan Kuala Lumpur' },
  { code: '15', name: 'Wilayah Persekutuan Labuan' },
  { code: '16', name: 'Wilayah Persekutuan Putrajaya' },
])

# Parties

coalitions = Coalition.create([
  { code: 'BN', name: 'National Front', name_in_malay: 'Barisan Nasional', founded_in: 1973 },
  { code: 'PR', name: 'People\'s Pact', name_in_malay: 'Pakatan Rakyat', founded_in: 2008 }
])

## See: http://en.wikipedia.org/wiki/List_of_political_parties_in_Malaysia
parties = Party.create([
  { code: 'UMNO', name: 'United Malays National Organisation', name_in_malay: 'Pertubuhan Kebangsaan Melayu Bersatu', founded_in: 1946 },
  { code: 'MCA', name: 'Malaysian Chinese Association', name_in_malay: 'Persatuan Cina Malaysia', founded_in: 1949 },
  { code: 'MIC', name: ' Malaysian Indian Congress', name_in_malay: 'Kongres India Malaysia', founded_in: 1946 },
  { code: 'GERAKAN', name: 'Malaysian People\'s Movement Party', name_in_malay: 'Parti Gerakan Rakyat Malaysia', founded_in: 1968 },
  { code: 'PPP', name: 'People\'s Progressive Party', name_in_malay: 'Parti Progresif Penduduk Malaysia', founded_in: 1953 },
  { code: 'PBB', name: 'United Bumiputera Heritage Party', name_in_malay: 'Parti Pesaka Bumiputera Bersatu', founded_in: 1973 },
  { code: 'SUPP', name: 'Sarawak United People\'s Party', name_in_malay: 'Parti Rakyat Bersatu Sarawak', founded_in: 1959 },
  { code: 'PBS', name: 'Sabah United Party', name_in_malay: 'Parti Bersatu Sabah', founded_in: 1985 },
  { code: 'LDP', name: 'Liberal Democratic Party', name_in_malay: 'Parti Liberal Demokratik', founded_in: 1988 },
  { code: 'PBRS', name: 'United Sabah People\'s Party', name_in_malay: 'Parti Bersatu Rakyat Sabah', founded_in: 1994 },
  { code: 'UPKO', name: 'United Pasokmomogun Kadazandusun Murut Organisation', name_in_malay: 'Pertubuhan Pasok Momogun Kadazandusun Murut Bersatu', founded_in: 1994 },
  { code: 'SPDP', name: 'Sarawak Progressive Democratic Party', name_in_malay: 'Parti Demokratik Progresif Sarawak', founded_in: 2002 },
  { code: 'PRS', name: 'Sarawak People\'s Party', name_in_malay: 'Parti Rakyat Sarawak', founded_in: 2004 },
  { code: 'PKR', name: 'People\'s Justice Party', name_in_malay: 'Parti Rakyat Sarawak', founded_in: 2003 },
  { code: 'DAP', name: 'People\'s Justice Party', name_in_malay: 'Parti Rakyat Sarawak', founded_in: 1966 },
  { code: 'PAS', name: 'Islamic Party of Malaysia', name_in_malay: 'Parti Rakyat Sarawak', founded_in: 1955 },
  { code: 'PRM', name: 'Malaysian People\'s Party', name_in_malay: 'Parti Rakyat Malaysia', founded_in: 1955 },
  { code: 'SNAP', name: 'Sarawak National Party', name_in_malay: 'Parti Kebangsaan Sarawak', founded_in: 1961 },
  { code: 'PSM', name: 'Socialist Party of Malaysia', name_in_malay: 'Parti Sosialis Malaysia', founded_in: 1998 },
  { code: 'MDP', name: 'Malaysian Democratic Party', name_in_malay: 'Parti Demokratik Malaysia', founded_in: 1998 },
  { code: 'SAPP', name: 'Sabah Progressive Party', name_in_malay: 'Parti Maju Sabah', founded_in: 1994 },
])

coalitionships = Coalitionship.create([
  { coalition_code: 'BN', party_code: 'UMNO', joined_at: 1973 },
  { coalition_code: 'BN', party_code: 'MCA', joined_at: 1973 },
  { coalition_code: 'BN', party_code: 'MIC', joined_at: 1973 },
  { coalition_code: 'BN', party_code: 'GERAKAN', joined_at: 1973 },
  { coalition_code: 'BN', party_code: 'PPP', joined_at: 1973 },
  { coalition_code: 'BN', party_code: 'PBB', joined_at: 1973 },
  { coalition_code: 'BN', party_code: 'SUPP', joined_at: 1973 },
  { coalition_code: 'BN', party_code: 'PBS', joined_at: 2002 },
  { coalition_code: 'BN', party_code: 'LDP', joined_at: 1991 },
  { coalition_code: 'BN', party_code: 'PBRS', joined_at: 1994 },
  { coalition_code: 'BN', party_code: 'UPKO', joined_at: 1994 },
  { coalition_code: 'BN', party_code: 'SPDP', joined_at: 2002 },
  { coalition_code: 'BN', party_code: 'PRS', joined_at: 2004 },
  { coalition_code: 'PR', party_code: 'PKR', joined_at: 2008 },
  { coalition_code: 'PR', party_code: 'DAP', joined_at: 2008 },
  { coalition_code: 'PR', party_code: 'PAS', joined_at: 2008 },
])

# Members

members_by_constituency = {};
members_by_district = {};

JSON.parse(File.open(File.dirname(__FILE__) + '/scraped/members.json').read).each do |e|

  region = regions.select { |v| v.name =~ Regexp.new(e['Negeri']) }.first
  party = parties.select { |v| e['Parti'] =~ Regexp.new(v.code) }.first

  if e['E-Mail'] && !e['E-Mail'].blank?
    email = e['E-Mail'].scan(/\w\S+@\S+\w/).select { |v| !/parlimen\.gov\.my/.match(v) }.first
  end
  if e['No_Telefon'] && !e['No_Telefon'].blank?
    phone = e['No_Telefon'][/^([\d \-]+)(?:,|\/)*/, 1].gsub(/[\-\s]/, '')
  end
  if e['No_Fax'] && !e['No_Fax'].blank?
    fax = e['No_Fax'][/^([\d \-]+)(?:,|\/)*/, 1].gsub(/[\-\s]/, '')
  end

  member = Member.create({ name: e['Nama'], email: email, phone: phone, fax: fax })
  PartyMembership.create({ member: member, party: party, joined_at: 2011 }).inspect # We assume that everyone joins their party before an election. Fix it up next time.

  members_by_constituency[e['Parlimen']] = member

end

# Constituencies and Districts
# See: http://en.wikipedia.org/wiki/List_of_Malaysian_electoral_districts
# In Malaysia, we call them Parliament Constituency and State Assembly District.
# See: http://en.wikipedia.org/wiki/District#Malaysia

JSON.parse(File.open(File.dirname(__FILE__) + '/scraped/constituencies.json').read).each do |e|
  constituency = Constituency.create({
    region: regions.select { |r| r.code == sprintf('%02d', e['region']) }.first,
    member: members_by_constituency[e['id']],
    name: e['name'].split(' ').map { |w| w.capitalize }.join(' '),
    iteration: 12,
    code: e['id'],
    valid_until: 2012
  })
end

JSON.parse(File.open(File.dirname(__FILE__) + '/scraped/sites.json').read).each do |e|
  code = e['id'].match(/(\d+)$/)[1]
  unless (constituency = Constituency.where(:iteration => 12, :code => code).limit(1).first).nil?
    member = constituency.member
    member.assign_attributes({ facebook: e['facebook_url'], twitter: e['twitter_url'], www: e['website_url'] })
    member.save
  end
end
