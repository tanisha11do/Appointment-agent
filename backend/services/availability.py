from backend.db.connection import get_connection

TIME_RANGES = {
    "morning": ("08:00", "12:00"),
    "afternoon": ("12:00", "16:00"),
    "evening": ("16:00", "20:00")
}

def check_availability(specialisation, location, date, time_pref=None):
    conn=get_connection()
    cursor=conn.cursor(dictionary=True)

    query = """
        SELECT
            d.doctor_id,
            d.name AS doctor_name,
            d.specialization,
            d.location,
            s.slot_id,
            s.start_time,
            s.end_time,
            CASE
                WHEN s.is_available = TRUE THEN 'AVAILABLE'
                ELSE 'BOOKED'
            END AS slot_status
        FROM doctors d
        JOIN slots s
          ON d.doctor_id = s.doctor_id
        WHERE d.specialization = %s
          AND d.location = %s
          AND s.slot_date = %s
        ORDER BY d.name, s.start_time
    """

    params = [specialisation, location, date]

    cursor.execute(query, params)
    results = cursor.fetchall()

    cursor.close()
    conn.close()

    if results:
        return results
    else:
        print("Sorry! No more slots available")

# def check_slot_availability(doctor_id, date):
#     conn = get_connection()
#     cursor = conn.cursor(dictionary=True)

#     # query = """
#     # SELECT
#     #     s.slot_id,
#     #     s.start_time,
#     #     s.end_time,
#     #     CASE
#     #         WHEN a.appointment_id IS NULL THEN 'AVAILABLE'
#     #         ELSE 'BOOKED'
#     #     END AS status
#     # FROM slots s
#     # LEFT JOIN appointments a
#     #     ON s.slot_id = a.slot_id
#     #     AND a.appointment_date = %s
#     # WHERE s.doctor_id = %s
#     # ORDER BY s.start_time
#     # """

#     query = """
#         SELECT
#             slot_id,
#             start_time,
#             end_time,
#             is_available
#         FROM slots
#         WHERE doctor_id = %s
#           AND slot_date = %s
#         ORDER BY start_time
#     """

#     cursor.execute(query, (date, doctor_id))
#     slots = cursor.fetchall()

#     cursor.close()
#     conn.close()
#     return slots


