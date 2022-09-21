import rclpy
from rclpy.node import Node
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
from std_msgs.msg import String
#--------------------------------------
# ROS2PythonDoorOpenPracticeNode
# I want to make it communication between ROS1 and ROS2 :)
#--------------------------------------

class Door2Pub():
    
    def __init__(self):
        super().__init__(self.door2_pubsub)
        self.get_logger().info("initializing %s..." %(self.door2_pubsub))

        self.time_pub = self.create_publisher( String, "door_msg", 10)
        self.twist_pub = rospy.create_publisher( Twist, 'cmd_vel_mux/input/teleope', queue_size = 1)
        self.count = 0
        
        self.time_period = 1.0
        self.create_timer(self.time_period, self.MessageCB)
        self.get_logger().info("execute %s..." % self.door2_pubsub)

    def MessageCB(self):
        self.count += 1

        msg = String()
        msg.data = "TIME: [ {0} ]".format(self.count)

        self.set_logger().info("Publishing: {0}".format(msg.data))
        self.time_pub.publish(msg)

    def GoStraight(self, value):
        twist = Twist()
        twist.linear.x = value
        rospy.sleep(0.1)
        self.twist_pub.publish(twist)

