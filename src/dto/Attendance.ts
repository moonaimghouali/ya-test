interface Attendance {
    employeeId?: string    
    date: Date
    checkIn: Date
    checkOut?: Date
    comment?: string
    presenceDuration?: Date
  }

  interface Id {
    id : string
  }

  interface CheckOut {
    id : string,
    comment: string
  }