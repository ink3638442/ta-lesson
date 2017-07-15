class Character
  #変数の読み書き用意
  attr_accessor :hp, :power

  #クラス作成時の初期値設定
  def initialize(hp, power)
    self.hp    = hp
    self.power = power
  end

  #オーバーライド用に残す
  def name
    #
  end

  def attack(character)
    character.hp -= self.power
    puts "#{self.name}が#{character.name}を攻撃して#{self.power}ポイントのダメージを与えた！"

    if character.hp <= 0
      self.defeat(character)
    end

    def defeat(character)
      puts "#{self.name}は#{character.name}を倒した！"
    end
  end
end

class Slime < Character
  #クラス変数
  @@type = 'スライム'

  attr_accessor :suffix

  def initialize(suffix)
    super(10, 3)
    self.suffix = suffix
  end

  def name
    @@type + self.suffix
  end

  def self.description
    puts @@type + 'は、最弱のモンスターだ！'
  end
end

class Hero < Character
  @@type = '主人公'
  def initialize
    super(1000, 30)
  end

  def name
    @@type
  end

  def self.description
    puts @@type + 'は、この世界を守る勇者だ！'
  end
end

hero = Hero.new
slime_A = Slime.new('A')

slime_A.attack(hero)
hero.attack(slime_A)

Hero.description
Slime.description
