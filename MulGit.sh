if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <profile>"
    exit 1
fi

# Assign argument to variable
PROFILE="$1"

# Set Git config based on the profile
if [ "$PROFILE" == "Taohid" ]; then
    git config --local user.name "Taohidul Islam"
    git config --local user.email "taohidul.islam@brainstation-23.com"
elif [ "$PROFILE" == "Redwan" ]; then
    git config --local user.name "redwan1171"
    git config --local user.email "md.redwanuzzaman@brainstation-23.com"
elif [ "$PROFILE" == "tao73bot" ]; then
    git config --local user.name "tao73bot"
    git config --local user.email "mdtaohidul73@student.sust.edu"
else
    echo "Unknown profile: $PROFILE"
    exit 1
fi

echo "Git config updated successfully:"
git config --get user.name
git config --get user.email