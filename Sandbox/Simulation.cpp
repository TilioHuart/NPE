
#include <iostream>
#include "NPE/Physics.hpp"
#include "NPE/Renderer.hpp"

class Simulation {
    public:
        Simulation() {
            std::cout << "Simulation Lauched\n";
            NPE::Physics::printVersion();
            NPE::Renderer::printVersion();
            
        };
};

int main(void) {
    Simulation sim;
    return 0;
}