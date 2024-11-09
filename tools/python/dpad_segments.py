import sys
import cv2
import numpy as np

def generate_circle_segment_masks(n, r):
    # Create an empty list to store the segment masks
    segment_masks = []
    
    # Create a blank image with a circle of radius r
    diameter = 2 * r
    center = (r, r)
    
    for i in range(n):
        # Create a blank mask for each segment
        mask = np.zeros((diameter, diameter), dtype=np.uint8)
        
        # Calculate the angles for the segment
        start_angle = (360 / n) * i - ((360 / n)/2) # offset start by half of segment size to get correctly aligned dpad segments
        end_angle = start_angle + (360 / n)
        
        # Draw the filled segment in the mask
        cv2.ellipse(mask, center, (r, r), 0, start_angle, end_angle, 255, -1)
        
        # Append the mask to the list
        segment_masks.append(mask)
    
    return segment_masks

if __name__ == '__main__':
    radius = int(sys.argv[1])
    segments = int(sys.argv[2])
    # first segment will be right
    names = sys.argv[3].split(',')

    # create combined names for inbetween segments
    if len(names) == segments / 2:
        temp_names = []
        for i, name in enumerate(names):
            temp_names.append(f"{names[i]}")
            temp_names.append(f"{names[i]}_{names[(i+1) % len(names)]}")

        names = temp_names

    segment_masks = generate_circle_segment_masks(segments, radius)

    for i, mask in enumerate(segment_masks):
        # mask = cv2.bitwise_not(mask)
        merged = cv2.merge([mask, mask, mask, mask])

        cv2.imwrite(f"{names[i]}.png", merged)
        # output additional bmp for debug purposes - # godot doesn't let us import the same file as two different types
        cv2.imwrite(f"{names[i]}.bmp", mask)
