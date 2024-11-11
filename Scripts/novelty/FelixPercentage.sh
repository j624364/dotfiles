felix_count=$(pacman -Qq | xargs pacman -Qi | grep "Felix Yan" | wc -l)
total_count=$(pacman -Qq | wc -l)

percentage_equasion=$(echo $felix_count "/" $total_count)
echo $percentage_equasion
percentage=$(echo $percentage_equasion | bc -l)

echo $percentage

