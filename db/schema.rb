# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140627175220) do

  create_table "agendas", :force => true do |t|
    t.integer  "nquest"
    t.integer  "tipo"
    t.integer  "area"
    t.integer  "sexo"
    t.integer  "idade1"
    t.integer  "fxid"
    t.integer  "p1"
    t.integer  "p1a"
    t.integer  "p1b"
    t.integer  "p2"
    t.integer  "p2ano"
    t.integer  "p2mes"
    t.integer  "p2b"
    t.integer  "p3"
    t.integer  "p4a"
    t.integer  "p4b"
    t.integer  "p4c"
    t.integer  "p4d"
    t.integer  "p4e"
    t.integer  "p4f"
    t.integer  "p4g"
    t.integer  "p4h"
    t.integer  "p4i"
    t.integer  "p4j"
    t.integer  "p5"
    t.integer  "p6a"
    t.integer  "p6b"
    t.integer  "p6c"
    t.integer  "p6d"
    t.integer  "p6e"
    t.integer  "p6f"
    t.integer  "p6g"
    t.integer  "p6h"
    t.integer  "p6i"
    t.integer  "p6j"
    t.integer  "p7a"
    t.integer  "p7b"
    t.integer  "p7c"
    t.integer  "p7d"
    t.integer  "p7e"
    t.integer  "p7f"
    t.integer  "p7g"
    t.integer  "p7h"
    t.integer  "p7i"
    t.integer  "p7j"
    t.integer  "p8"
    t.integer  "p9a"
    t.integer  "p9b"
    t.integer  "p9c"
    t.integer  "p9d"
    t.integer  "p9e"
    t.integer  "p9f"
    t.integer  "p10a"
    t.integer  "p10ba_1"
    t.integer  "p10ba_2"
    t.integer  "p10ba_3"
    t.integer  "p10ba_4"
    t.integer  "p10b"
    t.integer  "p10bb_1"
    t.integer  "p10bb_2"
    t.integer  "p10bb_3"
    t.integer  "p10bb_4"
    t.integer  "p10c"
    t.integer  "p10bc_1"
    t.integer  "p10bc_2"
    t.integer  "p10bc_3"
    t.integer  "p10bc_4"
    t.integer  "p10d"
    t.integer  "p10bd_1"
    t.integer  "p10bd_2"
    t.integer  "p10bd_3"
    t.integer  "p10bd_4"
    t.integer  "p10e"
    t.integer  "p10be_1"
    t.integer  "p10be_2"
    t.integer  "p10be_3"
    t.integer  "p10be_4"
    t.integer  "p10f"
    t.integer  "p10bf_1"
    t.integer  "p10bf_2"
    t.integer  "p10bf_3"
    t.integer  "p10bf_4"
    t.integer  "p10g"
    t.integer  "p10bg_1"
    t.integer  "p10bg_2"
    t.integer  "p10bg_3"
    t.integer  "p10bg_4"
    t.integer  "p10h"
    t.integer  "p10bh_1"
    t.integer  "p10bh_2"
    t.integer  "p10bh_3"
    t.integer  "p10bh_4"
    t.integer  "p11aa"
    t.integer  "p11ab"
    t.integer  "p11ac"
    t.integer  "p11ad"
    t.integer  "p11ae"
    t.integer  "p11af"
    t.integer  "p11ba"
    t.integer  "p11bb"
    t.integer  "p11bc"
    t.integer  "p11bd"
    t.integer  "p11be"
    t.integer  "p11bf"
    t.integer  "p12"
    t.integer  "p13a"
    t.integer  "p13b"
    t.integer  "p13c"
    t.integer  "p13d"
    t.integer  "p13e"
    t.integer  "p13f"
    t.integer  "p14a"
    t.integer  "p14b"
    t.integer  "p14c"
    t.integer  "p14d"
    t.integer  "p15a"
    t.integer  "p15b"
    t.integer  "p15c"
    t.integer  "p15d"
    t.integer  "p15e"
    t.integer  "p15f"
    t.integer  "p16a"
    t.integer  "p16b"
    t.integer  "p16c"
    t.integer  "p16d"
    t.integer  "p16e"
    t.integer  "p16f"
    t.integer  "p16g"
    t.integer  "p16h"
    t.integer  "p16i"
    t.integer  "p16j"
    t.integer  "p17a"
    t.integer  "p17b"
    t.integer  "r17ab"
    t.integer  "p18aa"
    t.integer  "p18ab"
    t.integer  "p18ba"
    t.integer  "p18bb"
    t.integer  "p18ca"
    t.integer  "p18cb"
    t.integer  "p19aa"
    t.integer  "p19ab"
    t.integer  "p19ac"
    t.integer  "p19ba"
    t.integer  "p19bb"
    t.integer  "p19bc"
    t.integer  "p19ca"
    t.integer  "p19cb"
    t.integer  "p19cc"
    t.integer  "p20"
    t.integer  "p21a"
    t.integer  "p21b"
    t.integer  "p21c"
    t.integer  "p22a"
    t.integer  "p22b"
    t.integer  "p22c"
    t.integer  "p22d"
    t.integer  "p22e"
    t.integer  "p22f"
    t.integer  "p22g"
    t.integer  "p22h"
    t.integer  "p22i"
    t.integer  "p22j"
    t.integer  "p22k"
    t.integer  "p23a"
    t.integer  "p23b"
    t.integer  "p23c"
    t.integer  "p24a"
    t.integer  "p24b"
    t.integer  "p24c"
    t.integer  "p25"
    t.integer  "p26"
    t.integer  "p27a"
    t.integer  "p27b"
    t.integer  "p27ca"
    t.integer  "p27cb"
    t.integer  "p27cc"
    t.integer  "p27cd"
    t.integer  "p27ce"
    t.integer  "p27cf"
    t.integer  "r28"
    t.integer  "p28a"
    t.integer  "p28b"
    t.integer  "p28c"
    t.integer  "p28d"
    t.integer  "p28e"
    t.integer  "p28f"
    t.integer  "p28g"
    t.integer  "p28h"
    t.integer  "p28i"
    t.integer  "p28j"
    t.integer  "p28k"
    t.integer  "p28l"
    t.integer  "p28m"
    t.integer  "p28n"
    t.integer  "p28o"
    t.integer  "p29a"
    t.integer  "p29b"
    t.integer  "p29c"
    t.integer  "p29d"
    t.integer  "p29e"
    t.integer  "p29f"
    t.integer  "p29g"
    t.integer  "p29h"
    t.integer  "p29i"
    t.integer  "p29j"
    t.integer  "p29k"
    t.integer  "p29l"
    t.integer  "p29m"
    t.integer  "p29n"
    t.integer  "p29o"
    t.integer  "p30a"
    t.integer  "p30b"
    t.integer  "p30c"
    t.integer  "p30d"
    t.integer  "p30e"
    t.integer  "p30f"
    t.integer  "p30g"
    t.integer  "p30h"
    t.integer  "p30i"
    t.integer  "p30j"
    t.integer  "p30k"
    t.integer  "p30l"
    t.integer  "p30m"
    t.integer  "p30n"
    t.integer  "p30o"
    t.integer  "p31a"
    t.integer  "p31b"
    t.integer  "p31c"
    t.integer  "p31d"
    t.integer  "p31e"
    t.integer  "p31f"
    t.integer  "p31g"
    t.integer  "p31h"
    t.integer  "p31i"
    t.integer  "p31j"
    t.integer  "p31k"
    t.integer  "p31l"
    t.integer  "p31m"
    t.integer  "p31n"
    t.integer  "p31o"
    t.integer  "p32"
    t.integer  "p32a"
    t.integer  "p33a"
    t.integer  "p33b"
    t.integer  "p33c"
    t.integer  "p33d"
    t.integer  "p33e"
    t.integer  "p33f"
    t.integer  "p33g"
    t.integer  "p34"
    t.integer  "p35a"
    t.integer  "p35ba"
    t.integer  "p35bb"
    t.integer  "p35bc"
    t.integer  "p35ca"
    t.integer  "p35cb"
    t.integer  "p35cc"
    t.integer  "p36a"
    t.integer  "p36b"
    t.integer  "p36c"
    t.integer  "p37"
    t.integer  "p38aa"
    t.integer  "p38ab"
    t.integer  "p38ac"
    t.integer  "p38ba"
    t.integer  "p38bb"
    t.integer  "p38bc"
    t.integer  "p39"
    t.integer  "p40"
    t.integer  "p42a"
    t.integer  "p42b"
    t.integer  "p42c"
    t.integer  "p42d"
    t.integer  "p42e"
    t.integer  "p42f"
    t.integer  "p44ab"
    t.integer  "p45ab"
    t.integer  "p46a"
    t.integer  "p46b"
    t.integer  "p46c"
    t.integer  "p46d"
    t.integer  "p46e"
    t.integer  "p46f"
    t.integer  "p47"
    t.integer  "p47a"
    t.integer  "p47b"
    t.integer  "p47c"
    t.integer  "p47d"
    t.integer  "p47e"
    t.integer  "p47f"
    t.integer  "p47g"
    t.integer  "p48ab"
    t.integer  "p49a"
    t.integer  "p49ba"
    t.integer  "p49bb"
    t.integer  "p49bc"
    t.integer  "p49bd"
    t.integer  "p49be"
    t.integer  "p49bf"
    t.integer  "p50"
    t.integer  "p51"
    t.integer  "p52a"
    t.integer  "p52b"
    t.integer  "p52c"
    t.integer  "p52d"
    t.integer  "p52e"
    t.integer  "p52f"
    t.integer  "p53a"
    t.integer  "p53b"
    t.integer  "p53c"
    t.integer  "p53d"
    t.integer  "p53e"
    t.integer  "p54a"
    t.integer  "p54b"
    t.integer  "p54c"
    t.integer  "p54d"
    t.integer  "p54e"
    t.integer  "p54f"
    t.integer  "p54g"
    t.integer  "p54h"
    t.integer  "p54i"
    t.integer  "p54j"
    t.integer  "p55"
    t.integer  "p56a"
    t.integer  "p56b"
    t.integer  "p56c"
    t.integer  "p57a"
    t.integer  "p57b"
    t.integer  "p57c"
    t.integer  "p57d"
    t.integer  "p57e"
    t.integer  "p57f"
    t.integer  "p57g"
    t.integer  "p57h"
    t.integer  "p57i"
    t.integer  "p57j"
    t.integer  "p58aa"
    t.integer  "p58ab"
    t.integer  "p58ac"
    t.integer  "p58ad"
    t.integer  "p58ae"
    t.integer  "p58af"
    t.integer  "p58ba"
    t.integer  "p58bb"
    t.integer  "p58bc"
    t.integer  "p58bd"
    t.integer  "p58be"
    t.integer  "p58bf"
    t.integer  "p58ca"
    t.integer  "p58cb"
    t.integer  "p58cc"
    t.integer  "p58cd"
    t.integer  "p58ce"
    t.integer  "p58cf"
    t.integer  "p59aa"
    t.integer  "p59ca"
    t.integer  "p59da"
    t.integer  "p59ab"
    t.integer  "p59cb"
    t.integer  "p59db"
    t.integer  "p59ba"
    t.integer  "p59bb"
    t.integer  "p60"
    t.integer  "p61"
    t.integer  "p62a"
    t.integer  "p62b"
    t.integer  "p63"
    t.integer  "p64"
    t.integer  "p65"
    t.integer  "p66"
    t.integer  "p67"
    t.integer  "p68ano"
    t.integer  "p68mes"
    t.integer  "p69a"
    t.integer  "p69b"
    t.integer  "p69c"
    t.integer  "p69d"
    t.integer  "p69e"
    t.integer  "p69f"
    t.integer  "p69g"
    t.integer  "p69h"
    t.integer  "p70"
    t.integer  "p70aa"
    t.integer  "p70ab"
    t.integer  "p70ac"
    t.integer  "p70ad"
    t.integer  "p70ae"
    t.integer  "p70af"
    t.integer  "p71"
    t.integer  "p72aa"
    t.integer  "p72ab"
    t.integer  "p72ac"
    t.integer  "p72ad"
    t.integer  "p72ae"
    t.integer  "p72af"
    t.integer  "p72ag"
    t.integer  "p72ah"
    t.integer  "p72ai"
    t.integer  "p72aj"
    t.integer  "p72ba"
    t.integer  "p72bb"
    t.integer  "p72bc"
    t.integer  "p72bd"
    t.integer  "p72be"
    t.integer  "p72bf"
    t.integer  "p72bg"
    t.integer  "p72bh"
    t.integer  "p72bi"
    t.integer  "p72bj"
    t.integer  "p72ca"
    t.integer  "p72cb"
    t.integer  "p72cc"
    t.integer  "p72cd"
    t.integer  "p72ce"
    t.integer  "p72cf"
    t.integer  "p72cg"
    t.integer  "p73"
    t.integer  "p74a"
    t.integer  "p74b"
    t.integer  "p74c"
    t.integer  "p74d"
    t.integer  "p74e"
    t.integer  "p74f"
    t.integer  "p74g"
    t.integer  "p74h"
    t.integer  "p74i"
    t.integer  "p74j"
    t.integer  "p75a"
    t.integer  "p75b"
    t.integer  "p75c"
    t.integer  "p75d"
    t.integer  "p75e"
    t.integer  "p75f"
    t.integer  "p75g"
    t.integer  "p75h"
    t.integer  "p75i"
    t.integer  "p75j"
    t.integer  "p76a"
    t.integer  "p76b"
    t.integer  "p76c"
    t.integer  "p77a"
    t.integer  "p77b"
    t.integer  "p78"
    t.integer  "p79a"
    t.integer  "p79b"
    t.integer  "p79c"
    t.integer  "p79d"
    t.integer  "p79e"
    t.integer  "p79f"
    t.integer  "p80a"
    t.integer  "p80b"
    t.integer  "p80c"
    t.integer  "p80d"
    t.integer  "p80e"
    t.integer  "p80f"
    t.integer  "p81"
    t.integer  "p82a"
    t.integer  "p82b"
    t.integer  "p82c"
    t.integer  "p82d"
    t.integer  "p82e"
    t.integer  "p82f"
    t.integer  "p82g"
    t.integer  "p82h"
    t.integer  "p82i"
    t.integer  "p82j"
    t.integer  "p83a"
    t.integer  "p83b"
    t.integer  "p83c"
    t.integer  "p84a"
    t.integer  "p84ano"
    t.integer  "p84mes"
    t.integer  "p84dia"
    t.integer  "p85"
    t.integer  "p86"
    t.integer  "p87"
    t.integer  "p88b"
    t.integer  "p88c"
    t.integer  "p88d"
    t.integer  "p88e"
    t.integer  "p88f"
    t.integer  "p88g"
    t.integer  "p88h"
    t.integer  "p88i"
    t.integer  "p88j"
    t.integer  "p88k"
    t.integer  "p88l"
    t.integer  "p88m"
    t.integer  "p88n"
    t.integer  "p88o"
    t.integer  "p89a"
    t.integer  "p89b"
    t.integer  "p89c"
    t.integer  "p89d"
    t.integer  "p89e"
    t.integer  "p89f"
    t.integer  "p89g"
    t.integer  "p89h"
    t.integer  "p89i"
    t.integer  "p89j"
    t.integer  "p89k"
    t.integer  "p89l"
    t.integer  "p89m"
    t.integer  "p89n"
    t.integer  "p89o"
    t.integer  "p90a"
    t.integer  "p90b"
    t.integer  "p90c"
    t.integer  "p90d"
    t.integer  "p90e"
    t.integer  "p90f"
    t.integer  "p90g"
    t.integer  "p90h"
    t.integer  "p90i"
    t.integer  "p90j"
    t.integer  "p90k"
    t.integer  "p90l"
    t.integer  "p90m"
    t.integer  "p90n"
    t.integer  "p90o"
    t.integer  "p91a"
    t.integer  "p91ba"
    t.integer  "p91bb"
    t.integer  "p91bc"
    t.integer  "p91bd"
    t.integer  "p91be"
    t.integer  "p91bf"
    t.integer  "p92a"
    t.integer  "p92ba"
    t.integer  "p92bb"
    t.integer  "p92bc"
    t.integer  "p92bd"
    t.integer  "p92be"
    t.integer  "p92bf"
    t.integer  "p94"
    t.integer  "p95"
    t.integer  "p96"
    t.integer  "p97a"
    t.integer  "p97b"
    t.integer  "p97c"
    t.integer  "p97d"
    t.integer  "p97e"
    t.integer  "p97f"
    t.integer  "p98"
    t.integer  "p99a"
    t.integer  "p99b"
    t.integer  "p99c"
    t.integer  "p99d"
    t.integer  "p99e"
    t.integer  "p99f"
    t.integer  "p100aa"
    t.integer  "p100ab"
    t.integer  "p100ac"
    t.integer  "p100ad"
    t.integer  "p100ae"
    t.integer  "p100af"
    t.integer  "p100ag"
    t.integer  "p100ah"
    t.integer  "p100ai"
    t.integer  "p100aj"
    t.integer  "p100ba"
    t.integer  "p100bb"
    t.integer  "p100bc"
    t.integer  "p100bd"
    t.integer  "p100be"
    t.integer  "p100bf"
    t.integer  "p100bg"
    t.integer  "p100bh"
    t.integer  "p100bi"
    t.integer  "p100bj"
    t.integer  "p100ca"
    t.integer  "p100cb"
    t.integer  "p100cc"
    t.integer  "p100cd"
    t.integer  "p100ce"
    t.integer  "p100cf"
    t.integer  "p100cg"
    t.integer  "p100ch"
    t.integer  "p100ci"
    t.integer  "p100cj"
    t.integer  "p100da"
    t.integer  "p100db"
    t.integer  "p100dc"
    t.integer  "p100dd"
    t.integer  "p100de"
    t.integer  "p100df"
    t.integer  "p100dg"
    t.integer  "p100dh"
    t.integer  "p100di"
    t.integer  "p100dj"
    t.integer  "p101"
    t.integer  "p102"
    t.integer  "p103"
    t.integer  "p104a"
    t.integer  "p104b"
    t.integer  "p104c"
    t.integer  "p104d"
    t.integer  "p104e"
    t.integer  "p104f"
    t.integer  "p105"
    t.integer  "p106a"
    t.integer  "p106b"
    t.integer  "p107dia"
    t.integer  "p107mes"
    t.integer  "p107ano"
    t.integer  "p108a"
    t.integer  "p108b"
    t.integer  "p108c"
    t.integer  "p109a"
    t.integer  "p109b"
    t.integer  "p109c"
    t.integer  "p109d"
    t.integer  "p109e"
    t.integer  "p109f"
    t.integer  "p110"
    t.integer  "p111"
    t.integer  "p111a"
    t.integer  "p112"
    t.integer  "p113a"
    t.integer  "p113b"
    t.integer  "p113c"
    t.integer  "p113d"
    t.integer  "p113e"
    t.integer  "p113f"
    t.integer  "p114"
    t.integer  "p114nat"
    t.integer  "p114ado"
    t.integer  "p114ent"
    t.integer  "p115a"
    t.integer  "p115b"
    t.integer  "p115c"
    t.integer  "p115d"
    t.integer  "p115e"
    t.integer  "p115f"
    t.integer  "p116a"
    t.integer  "p116b"
    t.integer  "p117a"
    t.integer  "p117b"
    t.integer  "p117c"
    t.integer  "p117d"
    t.integer  "p118"
    t.integer  "p119a"
    t.integer  "p119b"
    t.integer  "p119c"
    t.integer  "p119d"
    t.integer  "p119e"
    t.integer  "p119f"
    t.integer  "p120"
    t.integer  "p121"
    t.integer  "p122"
    t.integer  "p123aa"
    t.integer  "p123ab"
    t.integer  "p123ac"
    t.integer  "p123ad"
    t.integer  "p123ae"
    t.integer  "p123af"
    t.integer  "p123ba"
    t.integer  "p123bb"
    t.integer  "p123bc"
    t.integer  "p123bd"
    t.integer  "p123be"
    t.integer  "p123bf"
    t.integer  "p124a"
    t.integer  "p124c"
    t.integer  "p124d"
    t.integer  "p124e"
    t.integer  "p124f"
    t.integer  "p124g"
    t.integer  "p124j"
    t.integer  "p124l"
    t.integer  "p124m"
    t.integer  "p124n"
    t.integer  "p124o"
    t.integer  "p124p"
    t.integer  "p124q"
    t.integer  "p124r"
    t.integer  "p124s"
    t.integer  "p124t"
    t.integer  "p124u"
    t.integer  "p125a"
    t.integer  "p125b"
    t.integer  "p125c"
    t.integer  "p125d"
    t.integer  "p125e"
    t.integer  "p125f"
    t.integer  "p126"
    t.integer  "p127a"
    t.integer  "p127b"
    t.integer  "p127c"
    t.integer  "p128"
    t.integer  "p129"
    t.integer  "p130a"
    t.integer  "p130b"
    t.integer  "p130c"
    t.integer  "p130d"
    t.integer  "p130e"
    t.integer  "p130f"
    t.integer  "p130g"
    t.integer  "p130h"
    t.integer  "p130i"
    t.integer  "p130j"
    t.integer  "p130k"
    t.integer  "p130l"
    t.integer  "p130m"
    t.integer  "p130n"
    t.integer  "p130o"
    t.integer  "p131"
    t.integer  "p132a"
    t.integer  "p132b"
    t.integer  "p132c"
    t.integer  "p132d"
    t.integer  "p132e"
    t.integer  "p132f"
    t.integer  "p132g"
    t.integer  "p132h"
    t.integer  "p133a"
    t.integer  "p133b"
    t.integer  "p133c"
    t.integer  "p133d"
    t.integer  "p133e"
    t.integer  "p133f"
    t.integer  "p133g"
    t.integer  "p133h"
    t.integer  "p133i"
    t.integer  "p133j"
    t.integer  "p134aa"
    t.integer  "p134ab"
    t.integer  "p134ac"
    t.integer  "p134ad"
    t.integer  "p134ae"
    t.integer  "p134af"
    t.integer  "p134b"
    t.integer  "p134ca"
    t.integer  "p134cb"
    t.integer  "p134cc"
    t.integer  "p134cd"
    t.integer  "p134ce"
    t.integer  "p134cf"
    t.integer  "p134da"
    t.integer  "p134db"
    t.integer  "p134dc"
    t.integer  "p134dd"
    t.integer  "p134de"
    t.integer  "p134df"
    t.integer  "p134ea"
    t.integer  "p134eb"
    t.integer  "p134ec"
    t.integer  "p134ed"
    t.integer  "p134ee"
    t.integer  "p134ef"
    t.integer  "p134fa"
    t.integer  "p134fb"
    t.integer  "p134fc"
    t.integer  "p134fd"
    t.integer  "p134fe"
    t.integer  "p134ff"
    t.integer  "p135"
    t.integer  "p136a"
    t.integer  "p137a"
    t.integer  "p138a"
    t.integer  "p139a"
    t.integer  "p140a"
    t.integer  "p141a"
    t.integer  "p136b"
    t.integer  "p137b"
    t.integer  "p138b"
    t.integer  "p139b"
    t.integer  "p140b"
    t.integer  "p141b"
    t.integer  "p142a"
    t.integer  "p142b"
    t.integer  "p142anos"
    t.integer  "p142dia"
    t.integer  "p143"
    t.integer  "p144"
    t.integer  "p145"
    t.integer  "p145a"
    t.integer  "p145b"
    t.integer  "p145c"
    t.integer  "p146"
    t.integer  "p146a"
    t.integer  "p147a"
    t.integer  "p147b"
    t.integer  "p147c"
    t.integer  "p148"
    t.integer  "p148a"
    t.integer  "p149a"
    t.integer  "p149b"
    t.integer  "p150a"
    t.integer  "p150b"
    t.integer  "p150c"
    t.integer  "p151a"
    t.integer  "p151c"
    t.integer  "p151b"
    t.integer  "reli1"
    t.integer  "reli2"
    t.integer  "p153"
    t.integer  "p154"
    t.integer  "r153_154"
    t.integer  "p155"
    t.integer  "p156aa"
    t.integer  "p156ab"
    t.integer  "p156ba"
    t.integer  "p156bb"
    t.integer  "p158a"
    t.integer  "p158b"
    t.integer  "p158c"
    t.integer  "p158d"
    t.integer  "p158e"
    t.integer  "p158f"
    t.integer  "p159a"
    t.integer  "p159b"
    t.integer  "p159c"
    t.integer  "p160"
    t.integer  "rendaia"
    t.integer  "rendai"
    t.integer  "rendafa"
    t.integer  "rendaf"
    t.float    "rendom"
    t.integer  "porte1"
    t.integer  "porte2"
    t.integer  "estado"
    t.integer  "partido"
    t.integer  "faixa_etaria_agreg"
    t.integer  "faixa_agrer2"
    t.integer  "cor_agreg"
    t.integer  "renda_ext"
    t.integer  "renda_ext_vali"
    t.integer  "est_ab"
    t.integer  "mundo_id"
    t.integer  "chefe_fam"
    t.integer  "filho_nat"
    t.integer  "tev_filho"
    t.integer  "net_agreg"
    t.integer  "info_agreg"
    t.integer  "ppj_copy"
    t.integer  "ppj_agreg_2"
    t.integer  "p41"
    t.integer  "p43"
    t.integer  "p43a"
    t.integer  "escol_agreg"
    t.float    "escol_agreg2"
    t.float    "peso_amostra"
    t.float    "peso_escola"
    t.float    "peso_sexidade"
    t.float    "peso_f"
    t.integer  "p152a_x"
    t.integer  "p152a_y"
    t.integer  "p153_154x"
    t.integer  "genero_raca"
    t.integer  "genero_idade"
    t.integer  "r2"
    t.integer  "defasa"
    t.integer  "r68"
    t.integer  "r84"
    t.integer  "z88"
    t.integer  "r107"
    t.integer  "r117a"
    t.integer  "r117b"
    t.integer  "r117c"
    t.integer  "r117d"
    t.integer  "ren_ind"
    t.integer  "ren_fam"
    t.integer  "regioes"
    t.integer  "conjugal"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "indicadors", :force => true do |t|
    t.string   "objetivo"
    t.integer  "fonte"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pnads", :force => true do |t|
    t.string   "codigo"
    t.integer  "ano"
    t.integer  "fxid"
    t.integer  "univ"
    t.integer  "area"
    t.integer  "sexo"
    t.integer  "cor"
    t.integer  "tipo"
    t.float    "analf"
    t.float    "educa"
    t.float    "freq"
    t.float    "nfreq"
    t.float    "freqfund"
    t.float    "freqfund1"
    t.float    "freqfund2"
    t.float    "ncompfund1"
    t.float    "ncompfund2"
    t.float    "nfncompfund1"
    t.float    "nfncompfund2"
    t.float    "nfcompfund1n2"
    t.float    "nfcompfundnfm"
    t.float    "freqmed"
    t.float    "freqmed2"
    t.float    "ncompmed"
    t.float    "nfncompmed"
    t.float    "nfcompmednfs"
    t.float    "freqprof"
    t.float    "freqprof2"
    t.float    "freqprof3"
    t.float    "freqcompsup"
    t.float    "freqcomppos"
    t.float    "ncompsup"
    t.float    "nestntrab"
    t.float    "nestnpea"
    t.float    "nestntrabnfil"
    t.float    "nestnpeanfil"
    t.float    "nestntrabnafaz"
    t.float    "nestnpeanafaz"
    t.float    "nestnpeanfilnafaz"
    t.float    "afaz20"
    t.float    "termfund"
    t.float    "termmed"
    t.float    "termsup"
    t.float    "vivfilocup"
    t.float    "vivfilnocup"
    t.float    "vivfilest"
    t.float    "vivfilnest"
    t.float    "vivfilocupest"
    t.float    "vivfilnocupnest"
    t.float    "vivfilocupaf"
    t.float    "vivfilnocupaf"
    t.float    "vivfilestaf"
    t.float    "vivfilnestaf"
    t.float    "vivfilocupestaf"
    t.float    "vivfilnocupnestaf"
    t.float    "sind"
    t.float    "outrotrab"
    t.float    "v0102"
    t.float    "pea"
    t.float    "idtrab15"
    t.float    "idtrab18"
    t.float    "dese"
    t.float    "desemes"
    t.float    "deseano"
    t.float    "ocup"
    t.float    "ocupano"
    t.float    "jatrab"
    t.float    "ocupano2"
    t.float    "proctrabocup"
    t.float    "outtrabocup"
    t.float    "outtrabocup2"
    t.float    "ocup2anos"
    t.float    "empdom"
    t.float    "scardom"
    t.float    "cprop"
    t.float    "informal"
    t.float    "trabnrem"
    t.float    "sal1"
    t.float    "sal2"
    t.float    "desloc1"
    t.float    "jornadanot"
    t.float    "jornada40"
    t.float    "jornada30"
    t.float    "nocup"
    t.float    "npea"
    t.float    "extpob"
    t.float    "pob"
    t.float    "cb"
    t.float    "cm"
    t.float    "ebia"
    t.float    "alim"
    t.float    "saudebom"
    t.float    "medico"
    t.float    "dentista"
    t.float    "procatend"
    t.float    "recebatend"
    t.float    "esporte"
    t.float    "esporte2"
    t.float    "acamados"
    t.float    "cronica"
    t.float    "nfezativ"
    t.float    "planosaude"
    t.float    "nuncafumou"
    t.float    "fuma"
    t.float    "fumadia"
    t.float    "fuma15"
    t.float    "fuma18"
    t.float    "tentouparar"
    t.float    "naoquerparar"
    t.float    "naofumamais"
    t.float    "fumardoenca"
    t.float    "tv2"
    t.float    "pc2"
    t.float    "violencia"
    t.float    "acidente"
    t.float    "mobilidade"
    t.float    "chefeconj"
    t.float    "filho"
    t.float    "outropar"
    t.float    "famconviv"
    t.float    "nvontadeprop"
    t.float    "mudar"
    t.float    "nsolteiro"
    t.float    "tfn"
    t.float    "celpess"
    t.float    "utilint3"
    t.float    "tv"
    t.float    "tvrad"
    t.float    "dvd"
    t.float    "telc"
    t.float    "tel"
    t.float    "mcp"
    t.float    "mcpint"
    t.float    "moto"
    t.float    "agua"
    t.float    "esco"
    t.float    "aguaesco"
    t.float    "lixo"
    t.float    "aguaescolixo"
    t.float    "dens"
    t.float    "luz"
    t.float    "seg"
    t.float    "segcasa"
    t.float    "segbairro"
    t.float    "segcid"
    t.float    "vitima"
    t.float    "vitimapoli"
    t.float    "conflito"
    t.float    "conflitosol"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "temas", :force => true do |t|
    t.string   "titulo"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "slug"
    t.string   "imagem_file_name"
    t.string   "imagem_content_type"
    t.integer  "imagem_file_size"
    t.datetime "imagem_updated_at"
  end

  add_index "temas", ["slug"], :name => "index_temas_on_slug", :unique => true

  create_table "temas_indicadors", :force => true do |t|
    t.integer  "tema_id"
    t.integer  "indicador_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "temas_indicadors", ["indicador_id"], :name => "index_temas_indicadors_on_indicador_id"
  add_index "temas_indicadors", ["tema_id"], :name => "index_temas_indicadors_on_tema_id"

end
