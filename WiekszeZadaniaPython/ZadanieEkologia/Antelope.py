from .Animal import Animal


class Antelope(Animal):
    def __init__(self, antelope=None, position=None, world=None):
        super(Antelope, self).__init__(antelope, position, world)

    def clone(self):
        return Antelope(self, None, None)

    def initParams(self):
        self.power = 4
        self.initiative = 3
        self.liveLength = 11
        self.powerToReproduce = 5
        self.sign = 'A'

    def move(self):
        lynx_nearby = self.find_lynx()     # znalezienie rysi w pobliżu
        if lynx_nearby:
            escape_position = self.get_escape_position(lynx_nearby)     # znalezienie drogi ucieczki
            if escape_position:
                return [Action(ActionEnum.A_MOVE, escape_position, 0, self)]   # ucieczka
            else:
                return [Action(ActionEnum.A_ATTACK, lynx_nearby.position, 0, self)] # atak
        else:
            return super().move()     # odpalenie zwykłego ruchu, gdy nie ma rysia w pobliżu

    def find_lynx(self):   # funkcja do znalezienia rysii
        for pos in self.getNeighboringPosition():
            organism = self.world.getOrganismFromPosition(pos)
            if organism and isinstance(organism, Lynx):
                return organism
        return None

    def get_escape_position(self, lynx):  # znelezienie pozycji do ucieczki
        direction_to_lynx = Position(lynx.position.x - self.position.x, lynx.position.y - self.position.y)
        escape_pos = Position(self.position.x - 2 * direction_to_lynx.x, self.position.y - 2 * direction_to_lynx.y)
        if self.world.positionOnBoard(escape_pos) and not self.world.getOrganismFromPosition(escape_pos):
            return escape_pos
        return None

    def getNeighboringPosition(self):
        return self.world.filterPositionsWithoutAnimals(self.world.getNeighboringPositions(self.position))
