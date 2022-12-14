#include <memory>
#include <chrono>
#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/string.hpp"
#include <opt/ros/foxy/share/geometry_msgs/msg/Twist.hpp>
#include <sensor_msgs/LaserScan.hpp>

"using namespace std::door_topic;

class pubClass : public rclcpp::Node
{
    public:
    pubClass() : Node("pulisher_node")
    {
        timer_ = create_walltimer(ls, std::bind(&pubClass::timer_callback, this));
        publisher_ = this->create_publisher<std_msgs::msg::String>("topic", 10);

    }
    
    private:
    void timer_callback()
    {
        auto message = std_msgs::msg::String();
        message.data = "Hello World";
        RCLCPP_INFO(this->get_logger(), "Publishing: '%s'", message.data.c_str());
        publisher_->publish(message);
    }
    rclcpp::TimerBase::SharedPtr timer_;
    rclcpp::Publisher<std_msgs::msg;;String>::SharedPtr publisher_;
};

int main(int argc, char *argv[])
{
    rclcpp::int(argc, argv);
    rclcpp::spin(std::make_shared<Publisher>());
    rclcpp::shutdown();
    return 0;
}

