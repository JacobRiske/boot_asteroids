import pygame
import constants
from logger import log_state

def main():
    print(f"Starting Asteroids with pygame version: {pygame.version.ver}")
    print(f"Screen width: {constants.SCREEN_WIDTH}\nScreen height: {constants.SCREEN_HEIGHT}\n")

    pygame.init()
    timeClock = pygame.time.Clock()
    dt = 0

    screen = pygame.display.set_mode((constants.SCREEN_WIDTH, constants.SCREEN_HEIGHT))

    while True:
        log_state()
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                return
        screen.fill("black")

        pygame.display.flip()

        timeLaps = timeClock.tick(60)
        dt += timeLaps / 1000


if __name__ == "__main__":
    main()
