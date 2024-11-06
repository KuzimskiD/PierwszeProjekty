from World import World
from Position import Position
from Organisms.Grass import Grass
from Organisms.Sheep import Sheep
from Organisms.Lynx import Lynx
from Organisms.Antelope import Antelope
import os
import unittest

def choose_position(world):
    print("Podaj współrzędne dla nowego organizmu (x y):")
    while True:
        try:
            x, y = map(int, input().split())
            pos = Position(xPosition=x, yPosition=y)
            if world.positionOnBoard(pos) and world.getOrganismFromPosition(pos) is None:
                return pos
            else:
                print("Nieprawidłowe współrzędne lub pole jest zajęte, spróbuj ponownie.")
        except ValueError:
            print("Nieprawidłowy format, wpisz dwie liczby oddzielone spacją.")

def choose_organism_type():
    print("Wybierz typ organizmu do dodania:")
    print("1: Owca")
    print("2: Trawa")
    print("3: Ryś")
    print("4: Antylopa")
    choice = input("Wybór: ")
    return int(choice)


def add_organism_to_world(world):
    pos = choose_position(world)
    organism_type = choose_organism_type()

    if organism_type == 1:
        organism = Sheep(position=pos, world=world)
    elif organism_type == 2:
        organism = Grass(position=pos, world=world)
    elif organism_type == 3:
        organism = Lynx(position=pos, world=world)
    elif organism_type == 4:
        organism = Antelope(position=pos, world=world)
    else:
        print("Nieznany typ organizmu.")
        return

    world.addOrganism(organism)
    print(f"Dodano {organism.__class__.__name__} na pozycji {pos}.")

def main():
    pyWorld = World(10, 10)

    newOrg = Grass(position=Position(xPosition=9, yPosition=9), world=pyWorld)
    pyWorld.addOrganism(newOrg)

    newOrg = Grass(position=Position(xPosition=1, yPosition=1), world=pyWorld)
    pyWorld.addOrganism(newOrg)

    newOrg = Sheep(position=Position(xPosition=2, yPosition=2), world=pyWorld)
    pyWorld.addOrganism(newOrg)

    print(pyWorld)

    for _ in range(50):
        input("Naciśnij Enter, aby kontynuować... ")
        os.system('cls')  # Czyści ekran

        if input("Czy chcesz dodać nowy organizm? (t/n): ").lower() == 't':
            add_organism_to_world(pyWorld)
        if input("Czy aktywować plagę? (t/n): ").lower() == 't':
            pyWorld.activatePlague()

        pyWorld.makeTurn()
        print(pyWorld)

class TestWorldMethods(unittest.TestCase):

    def test_add_organism(self):
        world = World(5, 5)
        sheep = Sheep(position=Position(xPosition=2, yPosition=2), world=world)
        self.assertTrue(world.addOrganism(sheep))
        self.assertIn(sheep, world.organisms)

    def test_add_organism_out_of_bounds(self):
        world = World(5, 5)
        sheep = Sheep(position=Position(xPosition=5, yPosition=5), world=world)
        self.assertFalse(world.addOrganism(sheep))

    def test_activate_plague(self):
        world = World(5, 5)
        sheep = Sheep(position=Position(xPosition=2, yPosition=2), world=world)
        sheep.liveLength = 10
        world.addOrganism(sheep)
        world.activatePlague()
        world.makeTurn()
        self.assertEqual(sheep.liveLength, 5)

    def test_plague_duration(self):
        world = World(5, 5)
        world.activatePlague()
        world.makeTurn()  # 1. tura plagi
        self.assertTrue(world._World__plagueActive)
        world.makeTurn()  # 2. tura plagi
        self.assertFalse(world._World__plagueActive)

    def test_emergency_measures(self):
        world = World(5, 5)
        lynx = Lynx(position=Position(xPosition=2, yPosition=2), world=world)
        world.addOrganism(lynx)
        world.emergency_measures()
        self.assertEqual(lynx.liveLength, lynx.liveLength)
        self.assertEqual(lynx.powerToReproduce, lynx.powerToReproduce)

if __name__ == '__main__':
	main()
    #unittest.main()