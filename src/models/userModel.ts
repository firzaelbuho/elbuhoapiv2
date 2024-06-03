interface User {
    userId: number;
    username: string;
    password: string;
    fullName: string;
}

let users: User[] = [
    { userId: 1, username: 'JohnDoe', password: 'password123', fullName: 'John Doe' },
    { userId: 2, username: 'JaneSmith', password: 'password456', fullName: 'Jane Smith' }
];

const userModel = {
    getUsers: (): User[] => users,
    getUserById: (id: string): User | undefined => users.find(user => user.userId === parseInt(id)),
    // Implementasi fungsi lainnya (createUser, updateUser, deleteUser)
};

export default userModel;
